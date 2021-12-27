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
-- Database: `licencas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `licencas`
--

CREATE TABLE `licencas` (
  `id` int(11) NOT NULL,
  `idsistema` varchar(64) NOT NULL,
  `idinstalacao` varchar(64) NOT NULL,
  `datainstalacao` datetime NOT NULL,
  `ultimasincronizacao` datetime NOT NULL,
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
  `msgdireta` varchar(250) DEFAULT NULL,
  `executado` char(1) DEFAULT '0' COMMENT '0 para nÃ£o 1 para sim'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `licencas`
--

INSERT INTO `licencas` (`id`, `idsistema`, `idinstalacao`, `datainstalacao`, `ultimasincronizacao`, `estadolicenca`, `versao`, `gerarchavepor`, `diasavencer`, `dataavencer`, `chave`, `dataultimachave`, `onoff`, `nome`, `email`, `cpfcnpj`, `cep`, `endereco`, `cidade`, `estado`, `celular`, `ultimoip`, `comando`, `msgdireta`, `executado`) VALUES
(13, '19791900301', '20712391310', '2021-04-12 11:59:38', '2021-04-14 11:33:54', 0, '1', NULL, 0, '2021-04-14', 'DEMONSTRAÇÃO', '2021-04-14', 0, '', 'demo@gmail.com', '', '', '', '', '', '', '201.17.211.207', NULL, NULL, '0'),
(14, '19791900301', '21611931159', '2021-04-12 11:59:49', '2021-04-12 16:06:03', 0, '1', NULL, 5, '2021-04-17', 'DEMONSTRAÇÃO', '2021-04-12', NULL, 'teste', 'frentesist@gmail.com', '99.999.999/0001', '31540-240', 'Rua Egito, Jardim Leblon', 'Belo Horizonte', 'MG', '31993855429', '', NULL, NULL, '0'),
(15, '19791900301', '20910742959', '2021-04-12 12:00:23', '2021-04-12 15:34:43', 0, '1', NULL, 2, '2021-04-14', 'DEMONSTRAÇÃO', '2021-04-12', NULL, 'João Marcos', 'comercial@frenteautomacao.com.br', '28.490.323/0001', '30170-120', 'Rua Curitiba, Centro', 'Belo Horizonte', 'MG', '31982732383', '', NULL, NULL, '0'),
(16, '19791900301', '20570877436', '2021-04-12 15:06:17', '2021-04-12 16:04:19', 0, '1', NULL, 2, '2021-04-14', 'DEMONSTRAÇÃO', '2021-04-12', NULL, 'Ellen', 'frentesist@gmail.com', '02.026.750/0001', '30170-124', 'Rua Curitiba, Centro', 'Belo Horizonte', 'MG', '31993855429', '', NULL, NULL, '0'),
(17, '19791900301', '19926813125', '2021-04-13 10:25:46', '2021-04-15 14:22:45', 0, '1', NULL, -6, '2021-04-09', 'DEMONSTRAÇÃO', '2021-04-15', NULL, '', 'antoniobarros1304@gmail.com', '', '', '', '', '', '', '45.186.49.133', NULL, NULL, '0'),
(18, '19791900301', '20065011363', '2021-04-13 20:25:55', '2021-04-13 21:03:07', 0, '1', NULL, 2, '2021-04-15', 'DEMONSTRAÇÃO', '2021-04-13', NULL, 'Yuri Valariano de Souza', 'demo@gmail.com', '126.296.566-75', '31035-201', 'Rua Cláudio da Silva, Horto Florestal', 'Belo Horizonte', 'MG', '31985398249', '187.127.113.218', NULL, NULL, '0'),
(19, '19791900301', '21719960200', '2021-04-15 14:36:48', '2021-04-15 14:39:14', 0, '1', NULL, -3, '2021-04-12', 'DEMONSTRAÇÃO', '2021-04-15', NULL, '', 'hotwarez@gmail.com', '', '', '', '', '', '', '179.180.138.9', NULL, NULL, '0'),
(20, '1979190556', '1980243144', '2021-05-01 21:19:04', '2021-05-05 13:54:06', 0, '1', NULL, 1, '2021-05-06', 'DEMONSTRAÇÃO', '2021-05-05', NULL, 'Linces M', 'linces@gmail.com', '040.720.316-82', '38304-060', 'Rua Armando Fratari, Alcides Junqueira', 'Ituiutaba', 'MG', '99999999999', '177.106.65.254', NULL, NULL, '0');

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
  ADD PRIMARY KEY (`id`) USING BTREE;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
