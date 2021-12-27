CREATE OR ALTER trigger add_estoque_compra for compra_itens
active before insert position 0
AS
begin
   if (new.bloqueado ='S') then exit;
    UPDATE PRODUTO SET QTD_ATUAL = QTD_ATUAL + NEW.QTD WHERE CODIGO=NEW.fk_produto;
end;

CREATE OR ALTER trigger add_estoque_compra_fi for compra_itens
active after insert position 0
AS
begin
 if (new.bloqueado='S') then exit;
   if (new.eh_fiscal='S') then
     UPDATE PRODUTO SET QTD_FISCAL = QTD_FISCAL + NEW.QTD WHERE CODIGO=NEW.fk_produto;
end;

CREATE OR ALTER trigger baixa_estoque_real for nfe_detalhe
active before insert position 0
AS
declare variable vMovimento char(1);
begin

 if (new.bloqueado='S') then exit;

   select nfm.movimento FROM nfe_master NFM where nfm.codigo=new.fknfe into :vmovimento;

     if (new.gera_es='S') then begin
       if (vmovimento='E') then
          update produto set qtd_atual = qtd_atual + new.qtd where codigo=new.id_produto;
       if (vmovimento='S') then
          update produto set qtd_atual = qtd_atual - new.qtd where codigo=new.id_produto;
     end

end;

CREATE OR ALTER trigger composicao_add_estoque for vendas_composicao
active before delete position 0
AS
begin
   update produto set qtd_atual = qtd_atual + old.qtd where codigo=old.id_produto;
end;

CREATE OR ALTER trigger composicao_baixa_estoque for vendas_composicao
active before insert position 0
AS
begin
  update produto set qtd_atual = qtd_atual - new.qtd where codigo=new.id_produto;
end;

CREATE OR ALTER trigger compra_bu0 for compra
active before update position 0
AS
begin
  update compra_itens ci
  set
  ci.gera_cp=new.ajusta_pv,
  ci.gera_es=new.gera_es,
  ci.situacao=new.status
  where
  ci.fk_compra=old.id;
end;

CREATE OR ALTER trigger compra_cancela_updt for compra
active after update position 0
AS
 declare variable vProduto integer;
 declare variable vQtd float;
 declare variable vBloqueado char;
begin
  if (new.status='C') then begin
     for select ci.bloqueado, ci.fk_produto, ci.qtd from compra_itens ci where ci.fk_compra=old.id into :vBloqueado, :vproduto, :vqtd do 
begin
         update produto set qtd_atual = qtd_atual - :vqtd where codigo=:vproduto;
         if (not(vbloqueado='S')) then
           if (old.ehfiscal='S') then
            update produto set qtd_fiscal = qtd_fiscal - :vqtd where codigo=:vproduto;
     end
  end
end;

CREATE OR ALTER trigger compra_del_baixa_estoque for compra_itens
active after delete position 0
AS
begin

   if (old.bloqueado ='S') then exit;

   if (OLD.situacao<>'C') then begin
      UPDATE PRODUTO SET QTD_ATUAL = QTD_ATUAL - OLD.QTD WHERE CODIGO=OLD.fk_produto;
   end
end;

CREATE OR ALTER trigger compra_del_bx_est_fi for compra_itens
active after delete position 0
AS
begin

   if (old.bloqueado='S') then exit;

   if (OLD.situacao<>'C') then begin
     if (old.eh_fiscal='S') then
        UPDATE PRODUTO SET QTD_FISCAL = QTD_FISCAL - OLD.QTD WHERE CODIGO=OLD.fk_produto;
   end

end;

CREATE OR ALTER trigger compra_upd_baixa_estoque for compra_itens
active before update position 0
AS
begin
 if (old.bloqueado='S') then exit;

  if (new.situacao<>'C') then begin
     if (new.fk_produto=old.fk_produto) then begin
         update produto SET QTD_ATUAL = QTD_ATUAL + (new.qtd - old.qtd) where codigo=OLD.fk_produto;
     end
     if (new.fk_produto<>old.fk_produto) then begin
        if (new.qtd=old.qtd) then begin
          update produto SET QTD_ATUAL = QTD_ATUAL - old.qtd where codigo=OLD.fk_produto;
          update produto SET QTD_ATUAL = QTD_ATUAL + old.qtd where codigo=new.fk_produto;
        end

      if (new.qtd<>old.qtd) then begin
         update produto SET QTD_ATUAL = QTD_ATUAL - old.qtd where codigo=OLD.fk_produto;
         update produto SET QTD_ATUAL = QTD_ATUAL + new.qtd where codigo=new.fk_produto;
      end
     end
  end
end;

CREATE OR ALTER trigger compra_upd_bx_est_fi for compra_itens
active before update position 0
AS
begin

 if (new.bloqueado='S') then exit;

 if (new.eh_fiscal='S') then begin
   if (new.situacao<>'C') then begin
     if (new.fk_produto=old.fk_produto) then begin
       update produto SET QTD_FISCAL = QTD_FISCAL + (new.qtd - old.qtd) where codigo=OLD.fk_produto;
     end

    if (new.fk_produto<>old.fk_produto) then begin
       if (new.qtd=old.qtd) then begin
          update produto SET QTD_FISCAL = QTD_FISCAL - old.qtd where codigo=OLD.fk_produto;
          update produto SET QTD_FISCAL = QTD_FISCAL + old.qtd where codigo=new.fk_produto;
       end

       if (new.qtd<>old.qtd) then begin
           update produto SET QTD_FISCAL = QTD_FISCAL - old.qtd where codigo=OLD.fk_produto;
           update produto SET QTD_FISCAL = QTD_FISCAL + new.qtd where codigo=new.fk_produto;
       end
    end
   end
 end
end;

CREATE OR ALTER trigger contas_movimento_bi for contas_movimento
active before insert position 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_contas_movimento_id,1);
end;

CREATE OR ALTER trigger grade_add_estoque for vendas_detalhe
active before delete position 0
AS
BEGIN
  UPDATE PRODUTO_GRADE SET QTD = QTD + OLD.QTD WHERE CODIGO = OLD.FK_GRADE;
END;

CREATE OR ALTER trigger grade_baixa_estoque for vendas_detalhe
active before insert position 0
AS
BEGIN
 UPDATE PRODUTO_GRADE SET QTD = QTD - NEW.QTD WHERE CODIGO=NEW.FK_GRADE;
END;

CREATE OR ALTER trigger nfce_add_estoque_fiscal for nfce_detalhe
active before delete position 0
AS
begin
 if (old.bloqueado is null) then
   UPDATE PRODUTO SET QTD_FISCAL = QTD_FISCAL + OLD.QTD WHERE CODIGO=OLD.id_produto;
end;

CREATE OR ALTER trigger nfce_baixa_estoque_fiscal for nfce_detalhe
active after insert position 0
AS
begin
  if (new.bloqueado is null) then
     UPDATE PRODUTO SET QTD_FISCAL = QTD_FISCAL - NEW.QTD WHERE CODIGO=NEW.id_produto;
end;

CREATE OR ALTER trigger nfce_baixa_upd_estoque_fi for nfce_detalhe
active before update position 0
AS
begin
  if (old.bloqueado is null) then begin
   if (new.situacao='C') then
     UPDATE PRODUTO SET QTD_FISCAL = QTD_FISCAL + OLD.QTD WHERE CODIGO=OLD.id_produto;
  end
end;

CREATE OR ALTER trigger nfce_master_au0 for nfce_master
active after update position 0
AS
begin
  update nfce_detalhe set
   nfce_detalhe.situacao=new.situacao
  where
   nfce_detalhe.fkvenda=old.codigo;
end;

CREATE OR ALTER trigger nfe_atualiza_estoque for nfe_detalhe
active before insert position 0
AS
begin

 if (new.bloqueado='S') then exit;
 
 if (new.gera_es='S') then begin
  if (new.e_s='E') then
    update produto SET QTD_FISCAL = QTD_FISCAL + NEW.qtd where codigo=new.id_produto;
  if (new.e_s='S') then
    update produto SET QTD_FISCAL = QTD_FISCAL - NEW.qtd where codigo=new.id_produto;
 end
end;
