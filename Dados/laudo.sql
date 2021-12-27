-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 05-Maio-2021 às 19:57
-- Versão do servidor: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laudo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `laudo`
--

CREATE TABLE `laudo` (
  `codigo` int(11) NOT NULL,
  `data_classificacao` date NOT NULL,
  `municipio_classificacao` varchar(150) NOT NULL,
  `local_classificao` varchar(50) NOT NULL,
  `numero_contrato` varchar(50) NOT NULL,
  `lacre` varchar(50) NOT NULL,
  `origem` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `peso_liquido` decimal(15,2) NOT NULL,
  `peso_tara` decimal(15,2) NOT NULL,
  `peso_bruto` decimal(15,2) NOT NULL,
  `nota_fiscal` int(11) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `veiculo_vistoria` varchar(5) NOT NULL,
  `motorista` varchar(50) NOT NULL,
  `cpf_motorista` varchar(11) NOT NULL,
  `tipo_produto` varchar(10) NOT NULL,
  `queimados` decimal(15,2) NOT NULL,
  `ardidos` decimal(15,2) NOT NULL,
  `mofados` decimal(15,2) NOT NULL,
  `avariados` decimal(15,2) NOT NULL,
  `impurezas` decimal(15,2) NOT NULL,
  `amassados` decimal(15,2) NOT NULL,
  `umidade` decimal(15,2) NOT NULL,
  `esverdeados` decimal(15,2) NOT NULL,
  `picados` decimal(15,2) NOT NULL,
  `fermentados` decimal(15,2) NOT NULL,
  `insetos` varchar(5) NOT NULL,
  `sementes_toxicas` varchar(5) NOT NULL,
  `classificador` varchar(50) NOT NULL,
  `data_emissao` date NOT NULL,
  `laudo` varchar(50) NOT NULL,
  `situacao` varchar(1) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laudo`
--
ALTER TABLE `laudo`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laudo`
--
ALTER TABLE `laudo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
