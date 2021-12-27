/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : licencas

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 23/09/2020 14:21:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS licencas1;

USE licencas1;


CREATE TABLE `licencas` (
  `id` int(11) NOT NULL,
  `idsistema` varchar(64) DEFAULT NULL,
  `idinstalacao` varchar(64) DEFAULT NULL,
  `datainstalacao` datetime DEFAULT NULL,
  `ultimasincronizacao` datetime DEFAULT NULL,
  `estadolicenca` int(1) NOT NULL DEFAULT '0',
  `versao` char(1) NOT NULL DEFAULT '1',
  `gerarchavepor` char(1) DEFAULT NULL COMMENT '0 para dias ou 1 para data',
  `diasavencer` int(11) DEFAULT NULL,
  `dataavencer` date DEFAULT NULL,
  `chave` varchar(64) DEFAULT NULL,
  `dataultimachave` date DEFAULT NULL,
  `onoff` tinyint(1) DEFAULT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `cpfcnpj` varchar(15) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `endereco` varchar(128) DEFAULT NULL,
  `cidade` varchar(128) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `ultimoip` varchar(15) DEFAULT NULL,
  `comando` varchar(32) DEFAULT NULL,
  `executado` char(1) DEFAULT '0' COMMENT '0 para nÃ£o 1 para sim',
  `msgdireta` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `licencas`
--

INSERT INTO `licencas` (`id`, `idsistema`, `idinstalacao`, `datainstalacao`, `ultimasincronizacao`, `estadolicenca`, `versao`, `gerarchavepor`, `diasavencer`, `dataavencer`, `chave`, `dataultimachave`, `onoff`, `nome`, `email`, `cpfcnpj`, `cep`, `endereco`, `cidade`, `estado`, `celular`, `ultimoip`, `comando`, `executado`, `msgdireta`) VALUES
(1, '1979197301', '4569069321', '2021-01-06 13:18:07', '2021-01-06 14:02:41', 0, '1', NULL, 5, '2021-01-11', 'DEMONSTRAÇÃO', '2021-01-06', 0, 'Alice Silva', 'teste@teste.com.br', '947.726.420-21', '88110-130', 'Rua Domingos Abreu de Lima', 'Florianópolis', 'RN', '34991587421', '186.209.20.15', 'MSG ILEGAL', '0', NULL),
(2, '1979197301', '3632504918', '2021-01-10 09:36:00', '2021-01-10 09:44:14', 0, '1', NULL, 5, '2021-01-15', 'DEMONSTRAÇÃO', '2021-01-10', 0, 'Adhelmar Rondon Junior', 'rondon@kalungasoft.com.br', '092.156.538-05', '13202-700', 'RUA VÁRZEA PAULISTA 402', 'JUNDIAÍ', 'SP', '11039635452', '177.180.70.231', NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `datacadastro` datetime NOT NULL,
  `ativo` char(1) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `comissaopadrao` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `revendas`
--

CREATE TABLE `revendas` (
  `id` int(11) NOT NULL,
  `datacadastro` datetime NOT NULL,
  `ativo` char(1) NOT NULL,
  `tipodocumento` char(1) NOT NULL,
  `cpfcnpj` varchar(15) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `endereco` varchar(128) NOT NULL,
  `bairro` varchar(128) NOT NULL,
  `cidade` varchar(128) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `comissao` decimal(15,2) NOT NULL,
  `email` varchar(128) NOT NULL,
  `site` varchar(128) NOT NULL,
  `responsavel` varchar(128) NOT NULL,
  `telefone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `licencas`
--
ALTER TABLE `licencas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revendas`
--
ALTER TABLE `revendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `licencas`
--
ALTER TABLE `licencas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `revendas`
--
ALTER TABLE `revendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

