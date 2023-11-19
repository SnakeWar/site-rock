-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 30-Set-2023 às 22:39
-- Versão do servidor: 5.7.23-23
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vini2301_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Casa Pronta', 'Casa Pronta', 'casa-pronta', '2023-05-30 01:53:09', '2023-05-30 01:53:09', NULL),
(2, 'Em Construção', 'Em Construção', 'em-construcao', '2023-07-04 13:38:58', '2023-07-04 13:38:58', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `deleted_at`) VALUES
(2, 2, 1, NULL),
(5, 5, 1, NULL),
(6, 6, 1, NULL),
(7, 7, 2, NULL),
(8, 8, 1, NULL),
(9, 9, 1, NULL),
(10, 10, 1, NULL),
(11, 11, 1, NULL),
(12, 12, 1, NULL),
(13, 13, 1, NULL),
(14, 14, 1, NULL),
(15, 15, 1, NULL),
(16, 16, 1, NULL),
(17, 17, 1, NULL),
(18, 18, 1, NULL),
(19, 19, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cities`
--

INSERT INTO `cities` (`id`, `title`, `photo`, `slug`, `description`, `status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Natal', 'cities/vdsdBgisV3VbscxlqluVsp0fgmpO3ncYaeKpncdP.jpg', 'natal', 'Natal', 1, NULL, '2023-04-19 03:50:59', '2023-06-21 01:52:43', NULL),
(2, 'Parnamirim', 'cities/kr4X2tJrvGZHANaeUCyIYoQu7FEfkJUv7k1TCTZd.jpg', 'parnamirim', 'Parnamirim', 1, NULL, '2023-04-19 03:50:59', '2023-06-21 01:53:52', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `city_neighborhoods`
--

CREATE TABLE `city_neighborhoods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `city_neighborhoods`
--

INSERT INTO `city_neighborhoods` (`id`, `title`, `description`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Nova Parnamirim', NULL, 2, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(5, 'Parque das Nações', NULL, 2, '2023-04-22 01:22:27', '2023-04-22 01:22:27', NULL),
(6, 'Cajupiranga', NULL, 2, '2023-04-22 01:22:50', '2023-04-22 01:22:50', NULL),
(7, 'Pium', NULL, 2, '2023-04-22 01:23:23', '2023-04-22 01:23:23', NULL),
(8, 'Parque do Jiqui', NULL, 2, '2023-04-22 01:25:26', '2023-04-22 01:25:26', NULL),
(9, 'Emaús', NULL, 1, '2023-06-21 01:44:39', '2023-06-21 01:44:39', NULL),
(10, 'Ponta negra', NULL, 1, '2023-06-21 01:52:26', '2023-06-21 01:52:26', NULL),
(11, 'Lagoa Nova', NULL, 1, '2023-06-21 01:54:45', '2023-06-21 01:54:45', NULL),
(12, 'Pitimbú', NULL, 1, '2023-06-21 01:55:49', '2023-06-21 01:55:49', NULL),
(13, 'Neópolis', NULL, 1, '2023-06-21 01:57:23', '2023-06-21 01:57:23', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `configurations`
--

INSERT INTO `configurations` (`id`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'SOBRE_MIM', '<h3><span style=\"font-size:18px;\">Vinicius Araújo é corretor de imóveis no RN, desde 2020, atuando na região de <strong>Natal e Parnamirim</strong>. Especialista em Condomínio horizontais de alto padrão.</span></h3>', '2023-04-19 03:51:00', '2023-09-30 01:43:41'),
(2, 'termos-de-uso', '<h2 class=\"western\" style=\"text-align:center;\">Termos de Uso</h2><h2 class=\"western\"><span style=\"color:#444444;\">1. Termos</span></h2><p><span style=\"color:#444444;\">Ao acessar o site </span><a href=\"https://viniciusaraujoimoveis.com.br/\">Vinícius Araújo</a><span style=\"color:#444444;\">, concorda em cumprir estes termos de serviço, todas as leis e regulamentos aplicáveis ​​e concorda que é responsável pelo cumprimento de todas as leis locais aplicáveis. Se você não concordar com algum desses termos, está proibido de usar ou acessar este site. Os materiais contidos neste site são protegidos pelas leis de direitos autorais e marcas comerciais aplicáveis.</span></p><h2 class=\"western\"><span style=\"color:#444444;\">2. Uso de Licença</span></h2><p><span style=\"color:#444444;\">É concedida permissão para baixar temporariamente uma cópia dos materiais (informações ou software) no site Vinícius Araújo , apenas para visualização transitória pessoal e não comercial. Esta é a concessão de uma licença, não uma transferência de título e, sob esta licença, você não pode:&nbsp;</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">modificar ou copiar os materiais;&nbsp;</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">usar os materiais para qualquer finalidade comercial ou para exibição pública (comercial ou não comercial);&nbsp;</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">tentar descompilar ou fazer engenharia reversa de qualquer software contido no site Vinícius Araújo;&nbsp;</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">remover quaisquer direitos autorais ou outras notações de propriedade dos materiais; ou&nbsp;</span></p><p><span style=\"color:#444444;\">transferir os materiais para outra pessoa ou \"espelhe\" os materiais em qualquer outro servidor.</span></p><p><span style=\"color:#444444;\">Esta licença será automaticamente rescindida se você violar alguma dessas restrições e poderá ser rescindida por Vinícius Araújo a qualquer momento. Ao encerrar a visualização desses materiais ou após o término desta licença, você deve apagar todos os materiais baixados em sua posse, seja em formato eletrônico ou impresso.</span></p><h2 class=\"western\"><span style=\"color:#444444;\">3. Isenção de responsabilidade</span></h2><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">Os materiais no site da Vinícius Araújo são fornecidos \"como estão\". Vinícius Araújo não oferece garantias, expressas ou implícitas, e, por este meio, isenta e nega todas as outras garantias, incluindo, sem limitação, garantias implícitas ou condições de comercialização, adequação a um fim específico ou não violação de propriedade intelectual ou outra violação de direitos.</span></p><p><span style=\"color:#444444;\">Além disso, o Vinícius Araújo não garante ou faz qualquer representação relativa à precisão, aos resultados prováveis ​​ou à confiabilidade do uso dos materiais em seu site ou de outra forma relacionado a esses materiais ou em sites vinculados a este site.</span></p><h2 class=\"western\"><span style=\"color:#444444;\">4. Limitações</span></h2><p><span style=\"color:#444444;\">Em nenhum caso o Vinícius Araújo ou seus fornecedores serão responsáveis ​​por quaisquer danos (incluindo, sem limitação, danos por perda de dados ou lucro ou devido a interrupção dos negócios) decorrentes do uso ou da incapacidade de usar os materiais em Vinícius Araújo, mesmo que Vinícius Araújo ou um representante autorizado da Vinícius Araújo tenha sido notificado oralmente ou por escrito da possibilidade de tais danos. Como algumas jurisdições não permitem limitações em garantias implícitas, ou limitações de responsabilidade por danos conseqüentes ou incidentais, essas limitações podem não se aplicar a você.</span></p><h2 class=\"western\"><span style=\"color:#444444;\">5. Precisão dos materiais</span></h2><p><span style=\"color:#444444;\">Os materiais exibidos no site da Vinícius Araújo podem incluir erros técnicos, tipográficos ou fotográficos. Vinícius Araújo não garante que qualquer material em seu site seja preciso, completo ou atual. Vinícius Araújo pode fazer alterações nos materiais contidos em seu site a qualquer momento, sem aviso prévio. No entanto, Vinícius Araújo não se compromete a atualizar os materiais.</span></p><h2 class=\"western\"><span style=\"color:#444444;\">6. Links</span></h2><p><span style=\"color:#444444;\">O Vinícius Araújo não analisou todos os sites vinculados ao seu site e não é responsável pelo conteúdo de nenhum site vinculado. A inclusão de qualquer link não implica endosso por Vinícius Araújo do site. O uso de qualquer site vinculado é por conta e risco do usuário.</span></p><p>&nbsp;</p><h3 class=\"western\"><span style=\"color:#444444;\">Modificações</span></h3><p><span style=\"color:#444444;\">O Vinícius Araújo pode revisar estes termos de serviço do site a qualquer momento, sem aviso prévio. Ao usar este site, você concorda em ficar vinculado à versão atual desses termos de serviço.</span></p><h3 class=\"western\"><span style=\"color:#444444;\">Lei aplicável</span></h3><p><span style=\"color:#444444;\">Estes termos e condições são regidos e interpretados de acordo com as leis do Vinícius Araújo e você se submete irrevogavelmente à jurisdição exclusiva dos tribunais naquele estado ou localidade.</span></p><p style=\"line-height:100%;margin-bottom:0cm;\"><br>&nbsp;</p>', '2023-04-19 03:51:00', '2023-08-30 20:43:24'),
(3, 'politicas-de-privacidade', '<h2 class=\"western\" style=\"text-align:center;\"><span style=\"color:#444444;\">Política de Privacidade</span></h2><p><span style=\"color:#444444;\">A sua privacidade é importante para nós. É política do Vinícius Araújo respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site </span><a href=\"https://viniciusaraujoimoveis.com.br/\">Vinícius Araújo</a><span style=\"color:#444444;\">, e outros sites que possuímos e operamos.</span></p><p><span style=\"color:#444444;\">Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.</span></p><p><span style=\"color:#444444;\">Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.</span></p><p><span style=\"color:#444444;\">Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.</span></p><p><span style=\"color:#444444;\">O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas&nbsp;</span><a href=\"https://politicaprivacidade.com/\" target=\"_blank\"><span style=\"background-color:transparent;color:#444444;\">políticas de privacidade</span></a><span style=\"color:#444444;\">.</span></p><p><span style=\"color:#444444;\">Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.</span></p><p><span style=\"color:#444444;\">O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto conosco.</span></p><h3 class=\"western\"><span style=\"color:#444444;\">Compromisso do Usuário</span></h3><p><span style=\"color:#444444;\">O usuário se compromete a fazer uso adequado dos conteúdos e da informação que o Vinícius Araújo oferece no site e com caráter enunciativo, mas não limitativo:</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">A) Não se envolver em atividades que sejam ilegais ou contrárias à boa fé e à ordem pública;</span></p><p style=\"margin-bottom:0cm;\"><span style=\"color:#444444;\">B) Não difundir propaganda ou conteúdo de natureza racista, xenofóbica, B</span><a href=\"https://apostasonline.guru/betano-apostas/\"><span style=\"color:#212529;\"><span style=\"text-decoration:none;\">etano apostas</span></span></a><span style=\"color:#444444;\"> ou azar, qualquer tipo de pornografia ilegal, de apologia ao terrorismo ou contra os direitos humanos;</span></p><p><span style=\"color:#444444;\">C) Não causar danos aos sistemas físicos (hardwares) e lógicos (softwares) do Vinícius Araújo, de seus fornecedores ou terceiros, para introduzir ou disseminar vírus informáticos ou quaisquer outros sistemas de hardware ou software que sejam capazes de causar danos anteriormente mencionados.</span></p><h3 class=\"western\"><span style=\"color:#444444;\">Mais informações</span></h3><p><span style=\"color:#444444;\">Esperemos que esteja esclarecido e, como mencionado anteriormente, se houver algo que você não tem certeza se precisa ou não, geralmente é mais seguro deixar os cookies ativados, caso interaja com um dos recursos que você usa em nosso site.</span></p><p><span style=\"color:#444444;\">Esta política é efetiva a partir de&nbsp;15 April 2023 17:55</span></p><p style=\"line-height:100%;margin-bottom:0cm;\"><br>&nbsp;</p>', '2023-04-19 03:51:00', '2023-08-30 20:44:32'),
(4, 'APP_DESCRIPTION', '<h2><span style=\"font-size:20px;\">Natal e Parnamirim/RN.</span></h2>', '2023-04-19 03:51:00', '2023-08-30 23:02:36'),
(5, 'APP_EMAIL', 'viniciusaraujoimoveis@gmail.com', '2023-04-19 03:51:00', '2023-04-19 03:51:00'),
(6, 'APP_INSTAGRAM', 'https://www.instagram.com/viniciusaraujoimoveis/', '2023-04-19 03:51:00', '2023-08-07 20:19:46'),
(7, 'APP_NAME', '<h1>Sua casa está aqui!</h1>', '2023-04-19 03:51:00', '2023-08-30 19:51:15'),
(8, 'APP_URL', 'https://viniciusaraujoimoveis.com.br', '2023-04-19 03:51:00', '2023-04-19 03:51:00'),
(9, 'APP_WHATSAPP', 'https://api.whatsapp.com/send?phone=5584998974590&amp;text=Ol%C3%A1!%20Vi%20seu%20site%20e%20gostaria%20de%20mais%20informa%C3%A7%C3%B5es.', '2023-04-19 03:51:00', '2023-08-29 00:49:40'),
(10, 'APP_ANALYTICS', '<!-- Google tag (gtag.js) --><script async=\"\" src=\"https://www.googletagmanager.com/gtag/js?id=G-1BB9HNR9LG\"></script><script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-1BB9HNR9LG\');\r\n</script>', '2023-04-21 20:43:17', '2023-04-21 23:09:13'),
(11, 'APP_INDEX_TITLE', 'Sua casa está aqui!', '2023-04-22 00:46:10', '2023-09-13 15:32:07'),
(12, 'APP_INDEX_SUBTITLE', '<p>Natal e Parnamirim/RN.</p>', '2023-04-22 00:46:32', '2023-09-13 15:18:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `readed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `telephone`, `readed`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mayrcon Marlon', '(84) 99900-3710', '1', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:03:55', '2023-06-08 21:43:49', '2023-06-08 21:43:49'),
(2, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:05:13', '2023-06-08 21:44:23', '2023-06-08 21:44:23'),
(3, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:05:48', '2023-06-08 21:44:25', '2023-06-08 21:44:25'),
(4, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:27:25', '2023-06-08 21:44:26', '2023-06-08 21:44:26'),
(5, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:29:00', '2023-06-08 21:44:28', '2023-06-08 21:44:28'),
(6, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 12:36:45', '2023-06-08 21:44:29', '2023-06-08 21:44:29'),
(7, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 13:04:09', '2023-06-08 21:44:30', '2023-06-08 21:44:30'),
(8, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 13:08:36', '2023-06-08 21:44:33', '2023-06-08 21:44:33'),
(9, 'Mayrcon Marlon', '(84) 99900-3710', '1', 'mayrcon_marlon@hotmail.com', '2023-04-19 13:14:48', '2023-06-08 21:44:36', NULL),
(10, 'Mayrcon Marlon', '(84) 99900-3710', '1', 'mayrcon_marlon@hotmail.com', '2023-04-19 13:16:10', '2023-06-08 21:44:16', '2023-06-08 21:44:16'),
(11, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-04-19 19:24:27', '2023-06-08 21:44:18', '2023-06-08 21:44:18'),
(12, 'bruno Teste', '(84) 99856-6030', '0', 'bruninhodoguara@gmail.com', '2023-06-08 02:28:33', '2023-06-08 21:44:20', '2023-06-08 21:44:20'),
(13, 'Thiago Carvalho', '(84) 99691-2490', '0', 'thiagocarvalhom3llo@gmail.com', '2023-06-08 15:42:32', '2023-06-08 21:44:21', '2023-06-08 21:44:21'),
(14, 'Denio da Silva Rebouças', '84987371014', '1', 'denio.reboucas@gmail.com', '2023-08-26 21:45:02', '2023-08-26 21:46:32', NULL),
(15, 'Denio da Silva Rebouças', '84987371014', '0', 'denio.reboucas@gmail.com', '2023-08-26 21:45:21', '2023-08-26 21:45:21', NULL),
(16, 'Mayrcon Marlon', '(84) 99900-6565', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 02:31:05', '2023-09-07 02:31:05', NULL),
(17, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 02:52:24', '2023-09-07 02:52:24', NULL),
(18, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 03:03:45', '2023-09-07 03:03:45', NULL),
(19, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 03:05:06', '2023-09-07 03:05:06', NULL),
(20, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 03:05:40', '2023-09-07 03:05:40', NULL),
(21, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 03:05:47', '2023-09-07 03:05:47', NULL),
(22, 'Mayrcon Marlon', '(84) 99900-3710', '0', 'mayrcon_marlon@hotmail.com', '2023-09-07 03:07:22', '2023-09-07 03:07:22', NULL),
(23, 'VINICIUS BARBOSA ARAUJO', '(84) 98893-8188', '0', 'rock_br97@yahoo.com.br', '2023-09-10 21:20:49', '2023-09-10 21:20:49', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_04_15_094908__create_cities_table', 1),
(5, '2019_04_15_094930__create_city_neighborhoods_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2020_11_09_075035_create_posts_table', 1),
(9, '2020_11_09_233043_create_categories_table', 1),
(10, '2020_11_12_202931_create_category_post_table', 1),
(11, '2020_11_12_212317_create_modules_table', 1),
(12, '2020_11_12_212340_create_roles_table', 1),
(13, '2020_11_12_212412_create_permissions_table', 1),
(14, '2020_11_12_212440_create_logs_table', 1),
(15, '2021_01_05_143554_create_post_photos_table', 1),
(16, '2021_04_19_181005_create_contacts_table', 1),
(17, '2023_04_02_220353_create_configurations_table', 1),
(18, '2023_11_09_233043_create_tags_table', 1),
(19, '2023_11_12_202931_create_post_tag_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `modules`
--

INSERT INTO `modules` (`id`, `title`, `url`, `description`, `icon`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Usuários', 'users', NULL, 'fas fa-fw fa-user', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58'),
(2, 'Grupos', 'roles', NULL, '', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58'),
(3, 'Contato', 'contacts', NULL, 'fas fa-fw fa-envelope', NULL, '2023-04-19 03:50:58', '2023-04-20 02:34:43'),
(4, 'Oportunidades', 'posts', NULL, 'fas fa-fw fa-building', NULL, '2023-04-19 03:50:58', '2023-04-20 02:34:01'),
(5, 'Módulos', 'modules', NULL, 'fas fa-fw fa-database', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58'),
(6, 'Categorias', 'categories', NULL, 'fas fa-fw fa-tags', NULL, '2023-04-19 03:50:58', '2023-04-20 02:35:03'),
(7, 'Tags', 'tags', NULL, 'fas fa-fw fa-tag', NULL, '2023-04-19 03:50:58', '2023-04-20 02:34:28'),
(8, 'Logs', 'logs', NULL, '', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58'),
(9, 'Cidades', 'cities', NULL, 'fas fa-fw fa-building', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58'),
(10, 'Configurações', 'configurations', NULL, 'fas fa-fw fa-wrench', NULL, '2023-04-19 03:50:58', '2023-04-19 03:50:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `description`, `module_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'read_users', NULL, 1, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(2, 'create_users', NULL, 1, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(3, 'update_users', NULL, 1, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(4, 'delete_users', NULL, 1, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(5, 'read_roles', NULL, 2, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(6, 'create_roles', NULL, 2, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(7, 'update_roles', NULL, 2, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(8, 'delete_roles', NULL, 2, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(9, 'read_contacts', NULL, 3, '2023-04-19 03:50:59', '2023-04-20 02:34:43', NULL),
(10, 'create_contacts', NULL, 3, '2023-04-19 03:50:59', '2023-04-20 02:34:43', NULL),
(11, 'update_contacts', NULL, 3, '2023-04-19 03:50:59', '2023-04-20 02:34:43', NULL),
(12, 'delete_contacts', NULL, 3, '2023-04-19 03:50:59', '2023-04-20 02:34:43', NULL),
(13, 'read_posts', NULL, 4, '2023-04-19 03:50:59', '2023-04-20 02:34:01', NULL),
(14, 'create_posts', NULL, 4, '2023-04-19 03:50:59', '2023-04-20 02:34:01', NULL),
(15, 'update_posts', NULL, 4, '2023-04-19 03:50:59', '2023-04-20 02:34:01', NULL),
(16, 'delete_posts', NULL, 4, '2023-04-19 03:50:59', '2023-04-20 02:34:01', NULL),
(17, 'read_modules', NULL, 5, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(18, 'create_modules', NULL, 5, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(19, 'update_modules', NULL, 5, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(20, 'delete_modules', NULL, 5, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(21, 'read_categories', NULL, 6, '2023-04-19 03:50:59', '2023-04-20 02:35:03', NULL),
(22, 'create_categories', NULL, 6, '2023-04-19 03:50:59', '2023-04-20 02:35:03', NULL),
(23, 'update_categories', NULL, 6, '2023-04-19 03:50:59', '2023-04-20 02:35:03', NULL),
(24, 'delete_categories', NULL, 6, '2023-04-19 03:50:59', '2023-04-20 02:35:03', NULL),
(25, 'read_tags', NULL, 7, '2023-04-19 03:50:59', '2023-04-20 02:34:28', NULL),
(26, 'create_tags', NULL, 7, '2023-04-19 03:50:59', '2023-04-20 02:34:28', NULL),
(27, 'update_tags', NULL, 7, '2023-04-19 03:50:59', '2023-04-20 02:34:28', NULL),
(28, 'delete_tags', NULL, 7, '2023-04-19 03:50:59', '2023-04-20 02:34:28', NULL),
(29, 'read_logs', NULL, 8, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(30, 'create_logs', NULL, 8, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(31, 'update_logs', NULL, 8, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(32, 'delete_logs', NULL, 8, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(33, 'read_cities', NULL, 9, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(34, 'create_cities', NULL, 9, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(35, 'update_cities', NULL, 9, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(36, 'delete_cities', NULL, 9, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(37, 'read_configurations', NULL, 10, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(38, 'create_configurations', NULL, 10, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(39, 'update_configurations', NULL, 10, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL),
(40, 'delete_configurations', NULL, 10, '2023-04-19 03:50:59', '2023-04-19 03:50:59', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `published_at` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_neighborhoods_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `dormitorios` int(11) DEFAULT '0',
  `banheiros` int(11) DEFAULT '0',
  `vagas_garagem` int(11) DEFAULT '0',
  `metro_quadrado_total` int(11) DEFAULT '0',
  `metro_quadrado_privado` int(11) DEFAULT '0',
  `latitude` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `longitude` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL,
  `highlight` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `published_at`, `user_id`, `city_id`, `city_neighborhoods_id`, `title`, `photo`, `slug`, `description`, `body`, `dormitorios`, `banheiros`, `vagas_garagem`, `metro_quadrado_total`, `metro_quadrado_privado`, `latitude`, `longitude`, `valor`, `highlight`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '2023-06-20', 1, 2, 8, 'Bosque das Flores - Parque do Jiqui', 'posts/ukmjRDo6bOAUD8nzBejSiufggMxknpQ4njHTYAbb.jpg', 'bosque-das-flores-parque-do-jiqui', 'Linda casa no condomínio Bosque das Flores', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Casa Duplex no <strong>condomínio Bosque das Flores</strong>, Localizada no Bairro Parque do Jiqui, próximo ao Shopping Cidade Verde, em Parnamirim/RN.<br><br>Terreno: 337 m²<br>Área Construída: 245 m²<br>Lado da sombra</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO TÉRREO:<br>| Sala para 2 ambientes<br>| 1 Suite<br>| Escritório&nbsp;<br>| Cozinha com projetados<br>| Despensa<br>| Dependência completa<br>| Espaço para piscina<br>| Área de serviço<br>| 4 Vagas de garagem</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO SUPERIOR:<br>| 3 Suítes com varanda sendo 2 com closet&nbsp;<br>| Quarto/Escritório com varanda<br>| Cond: R$ 565<br>| IPTU: R$ 2.600 (Anual)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Salão de festas<br>- Academia<br>- Playground&nbsp;<br>- Segurança 24h</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 1.200.000,00<br>(Aceita financiamento)<br><br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no Instagram: <a href=\"https://www.instagram.com/reel/CtrYcdBgfTX/\">https://www.instagram.com/reel/CtrYcdBgfTX</a></p>', 4, 4, 4, 337, 245, '-5.902898227393819', '-35.196734669312', '1200000.00', 1, 1, '2023-04-21 21:06:28', '2023-09-13 16:59:04', NULL),
(5, '2023-06-30', 2, 2, 6, 'Nova York - Cajupiranga', 'posts/mwTpkAczJQO3122utBwYRnhHc4B2CjCS4d08I6uY.jpg', 'nova-york-cajupiranga', 'Duplex Contemporânea no condomínio Nova York', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><strong>Casa Duplex no condomínio Nova York</strong>, Localizada no Bairro Cajupiranga, próximo ao Supermercado Atacadão, em Parnamirim/RN.</span></span><br><br>Terreno: 200 m²<br>Área Construída: 195 m²<br>Lado Sombra</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO TÉRREO:<br>| Sala para 2 ambientes<br>| 1 Quarto<br>| Área gourmet<br>| Cozinha com projetados<br>| Banheiro Social<br>| Área de serviço<br>| 2 Vagas de garagem</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO SUPERIOR:<br>| 3 Suítes sendo 1 Master com closet<br>| Cond: R$ 348<br>| IPTU: R$ 1.544 (Anual)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Piscina adulta e infantil&nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Quadra de tênis&nbsp;<br>- Playground&nbsp;<br>- Sala de TV<br>- Salão de festas<br>- Salão de jogos<br>- Churrasqueiras&nbsp;<br>- Academia<br>- Segurança 24h</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 750.000,00<br>(Aceita financiamento)<br><br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no Instagram: <a href=\"https://www.instagram.com/reel/Ctw5JiPAwt2/\">https://www.instagram.com/reel/Ctw5JiPAwt2/</a></p>', 4, 4, 4, 200, 195, '-5.942605199432274', '-35.24713767777736', '750000.00', 1, 1, '2023-06-30 21:31:37', '2023-09-13 16:58:13', NULL),
(6, '2023-06-30', 2, 1, 9, 'Condomínio Padre Monte - Emaús', 'posts/lrzG6LGOVsivc7N0RaoMxulP7bH8qBzB9gXMf1dZ.jpg', 'condominio-padre-monte-emaus', 'Linda Duplex no condomínio Padre Monte', '<p>Casa no condomínio Padre Monte, Localizada no Bairro Emaús, próximo ao Supermercado SuperFácil Atacado, em Parnamirim/RN.<br>&nbsp;<br>| Terreno: 400 m²<br>| Área Construída: 318 m²<br>| 3 Suítes<br>| 1 Quarto<br>| Área Gourmet<br>| 4 Vagas de garagem<br>&nbsp;<br>VALOR DE VENDA: R$ 950.000,00<br>Valor do Condomínio: R$ 915,00<br>&nbsp;<br>&nbsp;Fale comigo e agende agora mesmo sua visita!<br>&nbsp;<br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM @viniciusaraujoimoveis</p>', 4, 5, 4, 400, 318, '-5.881197663559827', '-35.22898847385264', '950000.00', 1, 0, '2023-06-30 21:59:36', '2023-07-14 01:06:25', '2023-07-14 01:06:25'),
(7, '2023-07-04', 2, 1, 10, 'Flora Boulevard - Ponta Negra', 'posts/f3T0PfVbTCGelze62eLri7GnzJelm0vU2tKLHXXx.jpg', 'flora-boulevard-ponta-negra', 'Mansão de alto padrão no condomínio Flora Boulevard', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Mansão no <strong>condomínio Flora Boulevard</strong>, Localizada no Ponta Negra, próximo a Rota do sol, em Natal/RN.<br><br>Terreno: 456 m²<br>Área Construída: 350 m²<br>Lado da sombra</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO TÉRREO:<br>| Sala para 2 ambientes<br>| 1 Suíte&nbsp;<br>| Escritório&nbsp;<br>| Cozinha com projetados<br>| Lavabo<br>| Area gourmet com churrasqueira<br>| Dependência completa<br>| Espaço para Piscina<br>| Despensa<br>| Área de serviço&nbsp;<br>| 6 Vagas de garagem</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO SUPERIOR:<br>| 1 Suíte Master com amplo closet e varanda<br>| 2 Suítes com closet<br>| Cond: R$ 850<br>| IPTU: R$ 4.500 (Anual)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Piscina adulta e infantil&nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Quadra Society<br>- Quadra de tênis&nbsp;<br>- Playground&nbsp;<br>- Salão de festas<br>- Salão de jogos<br>- Churrasqueiras&nbsp;<br>- Academia<br>- Segurança 24h</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 2.390.000,00<br>(Aceita financiamento)<br><br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no Instagram: <a href=\"https://www.instagram.com/reel/CtmYPJGAZUM/\">https://www.instagram.com/reel/CtmYPJGAZUM/</a></p>', 4, 6, 6, 456, 350, '-5.886448375671092', '-35.188656845016645', '2390000.00', 1, 1, '2023-07-04 13:47:27', '2023-09-13 16:57:24', NULL),
(8, '2023-07-04', 2, 2, 5, 'Central Park 2 - Parque das Nações', 'posts/Tpjq1B6X0CkRgAp0jJNk9RLzF21kq9DJLYPbGYny.jpg', 'central-park-2-parque-das-nacoes', 'Casa térrea ampla no condomínio Central Park 2', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Casa Térrea no condomínio Central Park 2, Localizada no Bairro Parque das Nações, próximo ao Supermercado Queiroz, em Parnamirim/RN.</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Terreno: 300 m²<br>Área Construída: 180 m²</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">| Sala para 2 ambientes<br>| 3 Suítes com closet<br>| Escritório&nbsp;<br>| Área Gourmet&nbsp;com churrasqueira<br>| Banheiro social<br>| Cozinha&nbsp;com projetados<br>| Despensa<br>| Area de serviço<br>| 2 Vagas de garagem&nbsp;<br>| Cond: R$ 350,00<br>| IPTU: R$ 2.300 (Anual)<br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br>- Quadra de areia<br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Segurança 24h</span></span></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 700.000,00<br>(Aceita financiamento)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no Instagram: <a href=\"https://www.instagram.com/reel/Ct6w17MAla9/\">https://www.instagram.com/reel/Ct6w17MAla9/</a></p>', 3, 4, 4, 300, 180, '-5.920014399790462', '-35.227047159083426', '700000.00', 0, 1, '2023-07-04 15:45:33', '2023-09-13 16:56:11', NULL),
(9, '2023-07-04', 2, 2, 5, 'Central Park 2 - Parque das Nações', 'posts/Ik3YZMPAKkRD8HOq1OdDZVTuHyckHK2dUFsxINsb.jpg', 'central-park-2-parque-das-nacoes-2', 'Linda casa térrea em um terreno amplo de esquina', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Casa Térrea no <strong>condomínio Central Park 2</strong>, Localizada no Bairro Parque das Nações, próximo ao Supermercado Queiroz, em Parnamirim/RN.</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Terreno: 503 m²<br>Área Construída: 250 m²</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">| Sala para 2 ambientes<br>| 3 Suítes sendo 1 master com closet<br>| 1 Quarto<br>| Área Gourmet&nbsp;com churrasqueira<br>| Escritório&nbsp;<br>| Piscina<br>| Banheiro social<br>| Cozinha&nbsp;<br>| Area de serviço<br>| 2 Vagas de garagem&nbsp;<br>| Cond: R$ 503,00<br>| IPTU: R$ 2.900 (Anual)<br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br>- Quadra de areia<br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Segurança 24h</span></span></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 1.100.000,00<br>(Aceita financiamento)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no Instagram: <a href=\"https://www.instagram.com/p/CshDGNygOkJ/\">https://www.instagram.com/p/CshDGNygOkJ/</a></p>', 4, 4, 2, 503, 250, '-5.91999305655535', '-35.22701497257597', '1100000.00', 1, 1, '2023-07-04 16:05:01', '2023-09-13 16:53:33', NULL);
INSERT INTO `posts` (`id`, `published_at`, `user_id`, `city_id`, `city_neighborhoods_id`, `title`, `photo`, `slug`, `description`, `body`, `dormitorios`, `banheiros`, `vagas_garagem`, `metro_quadrado_total`, `metro_quadrado_privado`, `latitude`, `longitude`, `valor`, `highlight`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, '2023-07-04', 2, 1, 9, 'Padre Monte - Emaús', 'posts/aKAWlAgllKEeB963XtWXQ09jCQIubfRgcKriIorp.jpg', 'padre-monte-emaus', 'Linda Duplex no condomínio Padre Monte', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><strong>Casa Duplex no condomínio Padre Monte</strong>, Localizada no Bairro Emaús, próximo ao Supermercado SuperFacil, em Parnamirim/RN.</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Terreno: 400 m²<br>Área Construída: 318 m²<br><br>- PAVIMENTO TÉRREO:<br>| Sala para 3 ambientes<br>| Área Gourmet&nbsp;com churrasqueira<br>| Espaco para piscina<br>| Dependencia completa<br>| Cozinha com projetados<br>| Despensa<br>| Lavabo<br>| Área de serviço<br>| 4 Vagas de garagem</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO SUPERIOR:<br>| 3 Suítes sendo 1 Master<br>| 1 Quarto<br>| Cond: R$ 915<br>| IPTU: R$ 3.195 (Anual)<br><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Campo de futebol</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de jogos</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Sauna</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Segurança 24h</span></span></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 950.000,00<br>(Aceita financiamento)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no instagram: <a href=\"https://www.instagram.com/reel/CuC6hXzAQBM/\">https://www.instagram.com/reel/CuC6hXzAQBM/</a></p>', 3, 5, 4, 400, 318, '-5.881160310282533', '-35.22899920272607', '950000.00', 1, 1, '2023-07-04 16:18:00', '2023-09-13 16:52:26', NULL),
(11, '2023-07-04', 2, 2, 5, 'Green Club 2 - Parque das Nações', 'posts/vfYxcXlY4EEy6cfgJT6I8pYMnTasF8w8YPBnBVYX.jpg', 'green-club-2-parque-das-nacoes', 'Casa ampla com projetados no condomínio Green Club 2', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><strong>Casa Térrea no condomínio Green Club 2</strong>, Localizada no Bairro Parque das Nações, próximo ao Supermercado Queiroz, em Parnamirim/RN.</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Terreno: 420 m²<br>Área Construída: 170 m²<br>Lado sombra</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">| Sala para 2 ambientes<br>| 1 Suíte master com closet<br>| 2 Semi suites<br>| Área Gourmet&nbsp;com churrasqueira<br>| Despensa<br>| Banheiro social<br>| Cozinha&nbsp;com projetados, forno e fogão&nbsp;<br>| Area de serviço<br>| Espaço para piscina<br>| 4 Vagas de garagem&nbsp;<br>| Cond: R$ 510,00<br>| IPTU: R$ 2.100 (Anual)<br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Quadra de tênis&nbsp;</span></span><br>- Quadra de areia<br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Campo de futebol</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Salão de jogos</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;\">- Segurança 24h</span></span></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 690.000,00<br>(Aceita financiamento)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no instagram: <a href=\"https://www.instagram.com/p/CoVgLoHAbBT/\">https://www.instagram.com/p/CoVgLoHAbBT/</a></p>', 3, 3, 4, 420, 170, '-5.9238654103736925', '-35.21892600269181', '690000.00', 1, 1, '2023-07-04 16:47:48', '2023-09-13 16:51:34', NULL),
(12, '2023-07-04', 2, 2, 5, 'Monte Carlo - Parque das Nações', 'posts/g9xcXXElrsBLE6qX0DXTBHi8u2X20TAMXJA3g1PN.jpg', 'monte-carlo-parque-das-nacoes', 'Duplex com excelente ventilação e espaço sua para piscina', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><strong>Casa Duplex no condomínio Monte Carlo,</strong> Localizada no Bairro <span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(0, 0, 0);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:left;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Parque das Nações</span></span>, <span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">próximo ao Supermercado Queiroz, em Parnamirim/RN.</span></span><br><br>Terreno: 250 m²<br>Área Construída: 162 m²<br>Casa muito ventilada</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO TÉRREO:<br>| Sala para 2 ambientes<br>| 1 Semi suíte&nbsp;<br>| Cozinha&nbsp;<br>| Área gourmet com churrasqueira<br>| Espaço para piscina<br>| Área de serviço<br>| 2 Vagas de garagem</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- PAVIMENTO SUPERIOR:<br>| 2 Suítes sendo 1 com closet<br>| 44 m² para outra suite ou solarium<br>| Cond: R$ 370<br>| IPTU: R$ 808,68 (Anual)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Piscina adulta e infantil&nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Quadra de tênis&nbsp;<br>- Playground&nbsp;<br>- Espaço mulher<br>- Espaço Kids<br>- Sauna<br>- Sala de massagem<br>- Salão de festas<br>- Salão de jogos<br>- Churrasqueiras&nbsp;<br>- Academia<br>- Segurança 24h</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 750.000,00<br>(Aceita financiamento)<br><br><br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no instagram: <a href=\"https://www.instagram.com/p/CuR64zCLAto/\">https://www.instagram.com/p/CuR64zCLAto/</a></p>', 3, 3, 4, 250, 162, '-5.927585800640043', '-35.20497623668649', '750000.00', 1, 1, '2023-07-04 17:11:07', '2023-09-13 16:50:29', NULL),
(13, '2023-07-04', 2, 2, 5, 'Green Club 3 - Parque das Nações', 'posts/9lDHhT5DuZ9CMpDDnr5ZI3dhWdUchRvFsG9xrs7w.jpg', 'green-club-3-parque-das-nacoes', 'Casa térrea ampla no condomínio Green Club 3', '<p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Casa Térrea no <strong>condomínio Green Club 3</strong>, Localizada no Bairro Parque das Nações, próximo ao Supermercado Queiroz, em Parnamirim/RN.</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Terreno: 360 m²<br>Área Construída: 196 m²</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">| Sala para 2 ambientes<br>| 2 Suítes sendo 1 com closet<br>| 1 Semi suite<br>| Área Gourmet&nbsp;com churrasqueira<br>| Banheiro social<br>| Cozinha&nbsp;<br>| Area de serviço<br>| 4 Vagas de garagem&nbsp;<br>| Cond: R$ 505,00<br>| IPTU: R$ 1.800 (Anual)<br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Quadra de tênis&nbsp;</span></span><br>- Quadra de areia<br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Campo de futebol</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Salão de jogos</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Segurança 24h</span></span></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\"><br>VALOR DO INVESTIMENTO: R$ 750.000,00<br>(Aceita financiamento)</p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;box-sizing:border-box;caret-color:rgb(33, 37, 41);color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Veja também no instagram: <a href=\"https://www.instagram.com/p/ClwUGX3Aks6/\">https://www.instagram.com/p/ClwUGX3Aks6/</a></p>', 3, 4, 4, 360, 196, '-5.92482745324566', '-35.225833458371255', '750000.00', 0, 1, '2023-07-04 19:13:37', '2023-09-13 16:40:19', NULL);
INSERT INTO `posts` (`id`, `published_at`, `user_id`, `city_id`, `city_neighborhoods_id`, `title`, `photo`, `slug`, `description`, `body`, `dormitorios`, `banheiros`, `vagas_garagem`, `metro_quadrado_total`, `metro_quadrado_privado`, `latitude`, `longitude`, `valor`, `highlight`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, '2023-07-04', 2, 2, 6, 'Nova York - Cajupiranga', 'posts/GoHKhxPbi8GQ5Nh1EFHths1JOQvdHyDfu52rvQfG.jpg', 'nova-york-cajupiranga-3', 'Casa com excelente espaço no condomínio Nova York', '<p>Casa Térrea no<strong> condomínio Nova York</strong>, Localizada no Bairro <span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">Cajupiranga, próximo ao Supermercado Atacadão, em Parnamirim/RN.</span></span></p><p>Terreno: 200 m²<br>Área Construída: 120 m²</p><p>| Sala para 2 ambientes<br>| 2 Suítes sendo 1 com closet<br>| 1 Semi suite<br>| Área Gourmet&nbsp;<br>| Banheiro social<br>| Cozinha&nbsp;ampla<br>| Despensa<br>| Area de serviço<br>| 2 Vagas de garagem&nbsp;<br>| Cond: R$ 348<br>| IPTU: R$ 1.500 (Anual)<br><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">INFORMAÇÕES DO CONDOMÍNIO: &nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Piscina adulta e infantil&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Quadra poliesportiva&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Quadra de tênis&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Playground&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Sala de TV</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Redario</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Salão de festas</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Salão de jogos</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Churrasqueiras&nbsp;</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Academia</span></span><br><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;\"><span style=\"-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;caret-color:rgb(33, 37, 41);display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;orphans:auto;text-align:start;text-decoration:none;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;\">- Segurança 24h</span></span><br><br><br>VALOR DO INVESTIMENTO: R$ 460.000,00<br>(Aceita financiamento)</p><p>VINICIUS ARAUJO - CRECI 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p>Veja também no Instagram: <a href=\"https://www.instagram.com/reel/CukY4R4AMyz/\">https://www.instagram.com/p/ClwUGX3Aks6/</a></p>', 3, 3, 4, 200, 120, '-5.942792993461275', '-35.24718305750135', '460000.00', 0, 1, '2023-07-04 19:35:50', '2023-09-13 16:39:06', NULL),
(15, '2023-07-04', 2, 2, 6, 'Nova York - Cajupiranga', 'posts/VW9b7XKWapMsKG3x7RFKHLyBIRxmou2lUslbxVp4.jpg', 'nova-york-cajupirangaaa', 'Casa térrea no condomínio Nova York', '<p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">⚜️ Nova York - Cajupiranga 📍</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Casa Térrea disponível para venda.<br>| Terreno: 200 m²&nbsp;<br>| Área construída: 115 m²&nbsp;<br>| 2 Suítes,&nbsp;<br>| 1 Quarto<br>| Cozinha<br>| Depensa<br>| Area de serviço<br>| 2 Vagas de garagem.</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Valor de condomínio: R$ 348,00<br>VALOR DE VENDA: R$ 450.000,00<br>Aceita financiamento</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(33, 37, 41);font-family:Fonte, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.75;margin-bottom:1rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><br>📲 Fale comigo e agende agora mesmo sua visita!<br>(84)99897-4590.</p>', 3, 3, 2, 200, 115, '-5.943033335240445', '-35.2471638856272', '450000.00', 0, 0, '2023-07-04 21:34:38', '2023-07-14 01:32:07', '2023-07-14 01:32:07'),
(16, '2023-07-04', 2, 2, 6, 'Nova York - Cajupiranga', 'posts/CN1XsBBIX6BhceWqJO5TM6bsWSH0XZDppsKzJTgP.jpg', 'nova-york-cajupiranga-2', 'Linda Duplex no condomínio Nova York', '<p>Casa Duplex no condomínio Nova York, Localizada no Bairro Cajupiranga, próximo ao Supermercado Atacadão, em Parnamirim/RN.<br><br>Terreno: 240 m²<br>Área Construída: 155 m²<br>Lado da sombra</p><p>- PAVIMENTO TÉRREO:<br>| Sala para 2 ambientes<br>| 1 Quarto<br>| Cozinha com projetados<br>| Banheiro Social<br>| Área de serviço com projetados<br>| 4 Vagas de garagem</p><p>- PAVIMENTO SUPERIOR:<br>| 2 Suítes sendo 1 com closet<br>| Cond: R$ 348<br>| IPTU: R$ 1.544 (Anual)</p><p><br>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Piscina adulta e infantil&nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Quadra de tênis&nbsp;<br>- Playground&nbsp;<br>- Sala de TV<br>- Redario<br>- Salão de festas<br>- Salão de jogos<br>- Churrasqueiras&nbsp;<br>- Academia<br>- Segurança 24h</p><p><br>VALOR DO INVESTIMENTO: R$ 580.000,00<br>(Aceita financiamento)<br><br><br>VINICIUS ARAUJO - CRECI: 7421<br>(84)99897-4590 (WhatsApp)<br>INSTAGRAM <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p>Veja também no Instagram: <a href=\"https://www.instagram.com/p/CsYaOE5AD9g/\">https://www.instagram.com/p/CsYaOE5AD9g/</a></p>', 3, 3, 4, 240, 155, '-5.943033335240445', '-35.2471638856272', '580000.00', 0, 1, '2023-07-04 21:58:15', '2023-09-13 16:28:20', NULL),
(17, '2023-07-12', 1, 2, 6, 'Teste Mayrcon', 'posts/zT9eubxBc7yptoRLK7a2YMQRRnk5xQxqUUp8nzaM.jpg', 'teste-mayrcon', 'Teste Mayrcon', '<p>Teste Mayrcon</p>', 1, 1, 1, 430, 195, '-5.827063452674082', '-35.212233066558845', '111111.11', 0, 0, '2023-07-12 14:13:48', '2023-07-14 01:06:52', '2023-07-14 01:06:52'),
(18, '2023-07-17', 2, 2, 5, 'Central Park 2 - Parque das Nações', 'posts/5rSj6hp6gTobdnStbpHt2iFtxjBg8TXT2EZD9QRu.jpg', 'central-park-2-parque-das-nacoes-3', 'Casa com excelente espaço gourmet para curtir com a familia', '<p>Casa Térrea no <a href=\"https://www.google.com/search?q=vinicius+ara%C3%BAjo+-+imoveis&amp;rlz=1C1NDCM_pt-BRBR1007BR1012&amp;oq=&amp;aqs=chrome.0.35i39i362l2j46i39i199i362i465j35i39i362l4j69i59i450.1029j0j15&amp;sourceid=chrome&amp;ie=UTF-8\"><strong>condomínio Central Park 2</strong></a>, Localizada no Bairro Parque das Nações, próximo ao Supermercado Queiroz, em Parnamirim/RN.</p><p>Terreno: 300 m²<br>Área Construída: 172 m²</p><p>| Sala para 2 ambientes<br>| 2 Suítes sendo 1 master com closet<br>| 1 Semi Suite<br>| Área Gourmet&nbsp;com churrasqueira<br>| Escritório&nbsp;<br>| Banheiro social<br>| Cozinha<br>| Deposito&nbsp;<br>| Area de serviço<br>| 2 Vagas de garagem&nbsp;<br>| Cond: R$ 350,00<br>| IPTU: R$ 1.600 (Anual)</p><p>INFORMAÇÕES DO CONDOMÍNIO: &nbsp;<br>- Piscina adulta e infantil&nbsp;<br>- Quadra poliesportiva&nbsp;<br>- Quadra de areia<br>- Playground&nbsp;<br>- Salão de festas<br>- Churrasqueiras&nbsp;<br>- Academia<br>- Segurança 24h</p><p><br>VALOR DO INVESTIMENTO: R$ 730.000,00<br>(Aceita financiamento)</p><p>VINICIUS ARAUJO - CRECI 7421<br><a href=\"https://wa.me/5584998974590\">(84)99897-4590</a> (WhatsApp)<br>INSTAGRAM: <a href=\"https://www.instagram.com/viniciusaraujoimoveis/\">@viniciusaraujoimoveis</a></p><p>Veja também no Instagram:<a href=\"https://www.instagram.com/reel/Cu1cmIypedh/\"> https://www.instagram.com/reel/Cu1cmIypedh/</a></p>', 3, 4, 2, 300, 172, '-5.920048647255562', '-35.22706971954005', '730000.00', 0, 1, '2023-07-17 22:35:29', '2023-09-13 16:34:14', NULL),
(19, '2023-07-22', 1, 1, 9, 'Teste de reordenação de imagens', 'posts/p6padFjJa3wHsjhGPseMcX1gfxo6faqXD9Bgwgav.png', 'teste-de-reordenacao-de-imagens', 'Teste de reordenação de imagens', '<p>Teste de reordenação de imagens</p>', 1, 1, 1, 1, 1, '-8.222363866437243', '-36.12304687500001', '11111.11', 0, 0, '2023-07-22 22:33:04', '2023-07-30 01:56:44', '2023-07-30 01:56:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_photos`
--

CREATE TABLE `post_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photos_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `post_photos`
--

INSERT INTO `post_photos` (`id`, `photo`, `post_id`, `created_at`, `updated_at`, `photos_order`) VALUES
(124, 'posts/photos/jPuNa1Rt0OUHv3nBS0nhIAhqR6tJfzzhoQBIBBbu.jpg', 9, '2023-07-04 16:05:57', '2023-07-04 16:05:57', 1),
(125, 'posts/photos/4neJmW3r7F9xfuaJELYZzZGv131T78vfABFe4fUS.jpg', 9, '2023-07-04 16:05:57', '2023-07-04 16:05:57', 2),
(126, 'posts/photos/0DQuOhfECP557fjRv49UxIH4KrTz9dqlUwDfoSXA.jpg', 9, '2023-07-04 16:05:57', '2023-07-04 16:05:57', 3),
(127, 'posts/photos/66691vlQf3j1KzezG6w4fcovhq8VcjmoylV5XMZQ.jpg', 9, '2023-07-04 16:05:57', '2023-07-04 16:05:57', 4),
(129, 'posts/photos/HV4cZXEVo9VXKvUyD2zoRBmpa8hm7VYp96WmP9mr.jpg', 9, '2023-07-04 16:09:17', '2023-07-04 16:09:17', 5),
(130, 'posts/photos/YJ7QFAqZVEHvrUY75fGsVN0e9c2MXSeql0kM7C2w.jpg', 9, '2023-07-04 16:09:17', '2023-07-04 16:09:17', 6),
(131, 'posts/photos/qwKYFlQ3KdaKF0SzM03dOCqKPefhEQVOpqM1aZrF.jpg', 9, '2023-07-04 16:09:17', '2023-07-04 16:09:17', 7),
(132, 'posts/photos/t5tFhjCyFrj7PoSiZutaTud3JQTVlMWpxSeeywgQ.jpg', 9, '2023-07-04 16:09:17', '2023-07-04 16:09:17', 8),
(133, 'posts/photos/Kfwd1kGxc4AU5iVZdFJGe1GShVRrCCyYq0kDnX9z.jpg', 9, '2023-07-04 16:09:17', '2023-07-04 16:09:17', 9),
(134, 'posts/photos/c36K6FRHL1aHGXje5mHABOBQR8RxAkKtzasrH1hd.jpg', 9, '2023-07-04 16:09:57', '2023-07-04 16:09:57', 10),
(251, 'posts/photos/5K8DPDbQCMaSDooFY8b4AOV8QMjcyNrTSa8AgiyB.jpg', 16, '2023-07-07 15:41:16', '2023-09-16 00:32:31', 2),
(252, 'posts/photos/zZXKb1Lq4QSjquBnHGMB2rXteUd4btRHflI1NT8E.jpg', 16, '2023-07-07 15:41:16', '2023-09-16 00:32:31', 3),
(255, 'posts/photos/BMWo7WHFbC1orz46yfLl5fRO1qkzH4P8xiaMKvpn.jpg', 16, '2023-07-07 15:41:16', '2023-09-16 00:32:31', 4),
(258, 'posts/photos/FW7utPiD3UkqKkfPTJIXUKWBgFx0RWC2tR2t0O40.jpg', 16, '2023-07-07 15:41:16', '2023-09-16 00:32:31', 1),
(259, 'posts/photos/NOr19TFcBSPA1mKj3dm7aX58r652l5Bc8CHlXEX3.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(260, 'posts/photos/7NguprCuVi7ReJFbeBpvL4rl3WMG9eQohtKh2Y45.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(261, 'posts/photos/VkRMwmgtEZjCfvj0uaw7spfsbAq23DoBRLBnC3hS.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(262, 'posts/photos/b2Wmi5ZT4Yw02r3025fqMck6UqfeCaTV1AOayXen.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(263, 'posts/photos/U6xta5RuN3i6puBmTrLkudJC9ef0N2dC7fm5DxCz.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(264, 'posts/photos/sDJaFeX3tcQOL0YaL8mme2JbEMsCW0krzgqNPEdB.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(265, 'posts/photos/o1L3oGI4sHJvaQQPrQu1c6fqeHjCVrghZUPG4OTV.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(266, 'posts/photos/xxltgH15sYfg3NyUpxIK0teVgkKNTDRwg5mRxDuU.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(267, 'posts/photos/DGPtsYfNtMGiCaG6aWxkzrJjZ28KB3LnugId1ZeS.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(268, 'posts/photos/aSyCSGxKJKtw59GxhgVkax6aI8XTSrO7JsZOkk7L.jpg', 5, '2023-07-07 15:53:32', '2023-07-07 15:53:32', 0),
(269, 'posts/photos/OG41AGqLu4HQt0iMGSf87wAH6yO7LXZvJl5igucx.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(270, 'posts/photos/kWNtLOp1pnxIvJSDmIbDuwA8sgPlX3tybH3vujrT.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(271, 'posts/photos/14jEZZToSIZ9jPBjqkMc8ixoAAtvLoGtSSMlfiHd.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(272, 'posts/photos/KqJaAewncQidOTCfcM4AHH7I0hSlVsyZLCIyDpzy.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(273, 'posts/photos/oQqweQqVKP81tBlNZIm5KSacx400MFajjDOrlijC.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(274, 'posts/photos/xkfdXSi92WZVkNn0FUwFx4qNXBoOAS7iYl0HYwEi.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(275, 'posts/photos/X6asMM7bHdZx5e5Vq8y22IQfcR0egP1xq604tyUg.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(276, 'posts/photos/9Q5IYc6TikyAUHdmQpJoECniR5TBoUW90HaVMd6S.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(277, 'posts/photos/Bnk5vO1pJkt9oa71t9ZA09sI6EcZTVbsqY3mrXWv.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(278, 'posts/photos/qkRn7iMbJI8GCb5sCO9jqVpv8PHdUEwz0i95PBz2.jpg', 15, '2023-07-07 15:59:56', '2023-07-07 15:59:56', 0),
(279, 'posts/photos/N5BqbRK3xUisqY9gpqDMcDmGiUiGUnkt8CKdFmLY.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(280, 'posts/photos/S1XDQoHAK0cCukwcG1DYwgwhTkMtSIkHusVvC94m.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(281, 'posts/photos/O4UArBNd86PAElumdYZooP5NzEdBhfuvyO6fHBuy.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(282, 'posts/photos/wIMmP36bhYqKiXPbXLFx3Bfx7elpPePfye1wMgEm.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(283, 'posts/photos/HCdTkEghLtLnQTgB3rI6VSo8IxAQ4Uyl2SvxkNbd.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(284, 'posts/photos/3KfGqoucHIzq4GnaulREObotlGcTRjBr5uO3kZ8c.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(285, 'posts/photos/ePBxtWDsvkue5mpTj5kAQFEOA4xZq2YpKz7l1Gpy.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(286, 'posts/photos/3FYTKqn9ed6i6u58l6MKJfYu8VVUL6mpQrE4edC1.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(287, 'posts/photos/IeNqmLBqma9LddXmgffdk2HeyUXzdQO4EAwrauCc.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(288, 'posts/photos/a9NMO22bZxxfTWRDVeecdTt2UIKwTzspOy4JRKx0.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(289, 'posts/photos/9d0QVXgMVo5rwi6JLJmzr6XOxlEp8qssjnJvRfXR.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(290, 'posts/photos/osAT8fMj5OPosHAwaytOW5zsWdgUPpqJdvb2ca5E.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(291, 'posts/photos/aGiVBmSC8ZQBy3cLiDGRc2S1NgB8GvilF117W4wL.jpg', 14, '2023-07-07 16:23:20', '2023-07-07 16:23:20', 0),
(292, 'posts/photos/cLXUp372qfB2OrZBW0dQbQATHMFzwl0T42eJvDGO.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(293, 'posts/photos/KRB2ziTpbXfmPspvIw59D5JkZjRzs8twhl4KzF0l.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(294, 'posts/photos/VjC9vJKFhjk8r4xjz97etajvLXTs5KORHKeUhJXa.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(295, 'posts/photos/t8hvQpaCKZ82eweBMKciWjHpnnYQwUHIqw3HlwhV.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(296, 'posts/photos/3cM3NXeFpfNqT1BnuV3sHm4hZCABS8xKpYsALOCy.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(297, 'posts/photos/0SLXgR7fPzfoM86FQKGusk2ULNeGqhbbuI7zHgSr.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(298, 'posts/photos/V8zekkTzJQXzk3uVfToS5K8SfhKnC6yr0Pu1nycQ.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(299, 'posts/photos/hZ6AoQvrBOKQTnUvAKjmB26wYGBdkYZnxN8uUk04.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(300, 'posts/photos/1c5TVhfupOlXDzS44mS8ktvnZnbh3SJvZ6PuwOyt.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(301, 'posts/photos/TCqLPVo5XGtfZsmd4IFb1REkUfkZGR8HVF7ohZSj.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(302, 'posts/photos/NTLdbFl4gWKMvCXnibkXUrdxqDeSkvXsFA21IPhs.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(303, 'posts/photos/BLD31SJRI1wi1lnHrbHrw7XLVBTaMpQQfZHxZFMM.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(304, 'posts/photos/AMrrwKYpQOFHlQLQ7OePprZgWuHitbaBprsQVL7D.jpg', 13, '2023-07-07 16:29:43', '2023-07-07 16:29:43', 0),
(305, 'posts/photos/xO2UnqWCfAJkvgVf04AsvswhvSiQ442ZmfrTPBB9.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(306, 'posts/photos/0GISjkJ42HYNs186GFcp1pkvd6ALeoHIJs3drm4L.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(307, 'posts/photos/r8lvQKDtj038GyYiHucOD9ARmiiJOiQb7qGmYNS1.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(308, 'posts/photos/Ieg4tooYsAEtvGMEbb7Z7L2TpsvHSgMLmp46K3oi.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(309, 'posts/photos/bBv6UGwwUqyrp8pCbugTH5K2rVBnlr4TCKFLqu2n.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(310, 'posts/photos/eGipttlcKiR0m9fMvn8ra5rdYa1DlG8lSmF7IMfQ.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(311, 'posts/photos/F2QSMvcjQtQr6mavvHPUoLuLwkQKjiIkLslhy329.jpg', 12, '2023-07-07 16:35:37', '2023-07-07 16:35:37', 0),
(312, 'posts/photos/Ij1vOypF20myfiMOWyGnROm8R5qKcisyTNWT2RIC.jpg', 12, '2023-07-07 16:35:38', '2023-07-07 16:35:38', 0),
(313, 'posts/photos/pgqMyumpQKtqo0W2kBlEhoALnlqUM0nFukbcA4Dp.jpg', 12, '2023-07-07 16:35:38', '2023-07-07 16:35:38', 0),
(314, 'posts/photos/1St5CTJ92kzNyc9pdeSsJ9fsqpqmTvcmgpF3zVFm.jpg', 12, '2023-07-07 16:35:38', '2023-07-07 16:35:38', 0),
(315, 'posts/photos/UR3jqKK5XmmqCBPkXs5rnHXcLCSQVsYjemcLM5rP.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(316, 'posts/photos/skHAdE4xyOyYxWcnwXaB2ShWDHxcAste8TomtODj.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(317, 'posts/photos/KDR5TOIdUinCGEA7hrMakWwslWdB8d9JpseBCcf8.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(318, 'posts/photos/qk8SzOUkif7fjXMdMLKS9rq2C7R9FjXkGra4srJf.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(319, 'posts/photos/zJB2v2mRBJrZauU6K9TgEIcE61Dq7Wka9nuH3y8f.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(320, 'posts/photos/J4as1i4Z4DS45s9pNV60ZiztCau2GGnDpQqZkGwc.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(321, 'posts/photos/j98Q4aGbJAyxrlFFaxrkERN7bFOaGfUvVbiJyekg.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(322, 'posts/photos/iwD1N4CF9omNWtWDc0hcg7dDyUe43gIfANYZBpX3.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(323, 'posts/photos/a8ZgZHwJeW2586p0YnBsKBL6VaZdp0ONrOthZrVF.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(324, 'posts/photos/nDf5GBuZWuLZrsvOLp9WvobFo7y5eiS0HJdGEwAT.jpg', 11, '2023-07-07 16:40:20', '2023-07-07 16:40:20', 0),
(325, 'posts/photos/QTmfEY6w5KzhfrsvFIRcR9jwB6UXKCnkglm3KwI8.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(326, 'posts/photos/kYdZKcHTKs0ktypvlNuqzX4xm1CwEP3tyE9MSCVf.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(327, 'posts/photos/k5hPi78Qr9baVLjdmU2P1XkbT0bfrcmTwBmTdNzl.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(328, 'posts/photos/6x4MmkrEqwhTCASi7HMObkYaEBQ5hcreba7zyrPv.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(329, 'posts/photos/AH8f8p5y12gPWN70QYYmPeOVUv3msQ9KZsLa0Ewg.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(330, 'posts/photos/QtHPpHFAB90w1QgsesEVOdhrHx2kGQ856XN7xcHN.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(331, 'posts/photos/LXAGYre5keMFF4nbVQkDip7k17JVcdAUGvLH8Ah1.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(332, 'posts/photos/ifbpFzysGRpoyQFdiMcCpv78EjZps2Dze0Dh7ZJR.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(333, 'posts/photos/dg0gnSZTFc8pzJFNp06lvuCuUmVIkPHzMrHOfiQH.jpg', 10, '2023-07-07 16:43:54', '2023-07-07 16:43:54', 0),
(334, 'posts/photos/5N21nRv86fVLnisMwmnGgoibM62QlSM6EVoeQATz.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(335, 'posts/photos/dn7az7Mzc81ZeN125OkS3lcbbZYj7qr5LA2KAe7C.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(336, 'posts/photos/J5awU6WtnqkKMDQKtjBvw5PlxPJKwJH8qmJSSuYa.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(337, 'posts/photos/bbhIgCPkSdwmBnha0zyLJMjygTzcx1P0UNfNYYyx.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(338, 'posts/photos/bki5V364XJZxuNlPUsXQkx3YCOGFBvEwnv87FQ8H.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(339, 'posts/photos/ipDWSx6ZOJOMBdbBZG2smtJHZ4p09u4opGpcLDON.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(340, 'posts/photos/KTY6Ob8ablFh8WTv0oIblfALsLH9jc8ggkGH0AkP.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(341, 'posts/photos/eCNeChTkUqqmKKs9s6QZI7TpC69rAiUBYCNRJaXh.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(342, 'posts/photos/KV1wh2V2M215ErTkJY9LNGw4D8UqjiUTc9IYPNV1.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(343, 'posts/photos/toxmddRMw3yMLbeisQSIjK03cOBVJCrMwFZrBxnt.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(344, 'posts/photos/vS0zJTNbaBu6ZnvOeE9vMRUFw12cfFffLP8wpqzo.jpg', 8, '2023-07-07 16:49:09', '2023-07-07 16:49:09', 0),
(345, 'posts/photos/EOEqxMrWBls4CwJJj9pqLR8Mm4b0sfVCO28QzFkM.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(346, 'posts/photos/0hYO3e5pWEnwXf4meX3reHx9MWPdhyJatuRX7Cme.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(347, 'posts/photos/7xLrDBMnbvTsxQzV1mXgQrpMSVhbPK6XQDM1kcBC.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(348, 'posts/photos/jNP7sr1nBZOuzQdp8buIrr8OpJD7D11MSIBXYROQ.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(349, 'posts/photos/2V8GhGQMsTNRQF2rSeDaqAo8T2XBklD82txAoMTi.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(350, 'posts/photos/woIGQL1DPbwbGT5vZpHLU1eOSs0t1EClbJ659sgC.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(351, 'posts/photos/bCy5q8ILa4fsCrxDyPCSwf02XDaHuNYjlC6k3Mac.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(352, 'posts/photos/4gkJk3wej4Jyul5ojkRykVwsdtilDWCLTzDkJGdp.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(353, 'posts/photos/bJGFSYGvevuwuiflRRIMgkWUDW8OyXJsR94JZmcS.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(354, 'posts/photos/4IqzDFewZZdiqG93gVTmNRWfsKKgifrL7MQ5eenu.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(355, 'posts/photos/qtbUNt8SBlfhNGikOF7IC1YddHCmq76SXxhThmmZ.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(356, 'posts/photos/GKQIeFIF9M0uZ4VM6R2GcscUYMJOQgKfB2yFOD7Z.jpg', 7, '2023-07-07 16:57:08', '2023-07-07 16:57:08', 0),
(357, 'posts/photos/WL6d6i07qwvZ1p4gyE8QcQFBBgjkkCE6YdwQkSOp.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 1),
(358, 'posts/photos/XBxYTKfvEAEFkSWkqQ4npq7PKNgwEFT27XoeTX56.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 2),
(359, 'posts/photos/jRKw601APjwIEvh9aaaW5iVw9IQR3ruRT935uRs6.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 3),
(360, 'posts/photos/U1MV2PRu2Zon2Xd7DWo7DQ2E2aEqOSewYPQWiIq2.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 4),
(361, 'posts/photos/0HBaSg73ZX2s55zXEtidfTCM5vAmbSuyuwmHOLdh.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 5),
(362, 'posts/photos/Ur7wNi4JiG79EfzPMwf1Vrqrnik6ZKkLapRJPaS9.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 6),
(363, 'posts/photos/95XKs4QG6sO8NvwFNXwd55bclZCfVqBVnpGgqNV0.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 7),
(364, 'posts/photos/ImtOe6a1L0YbnOysgm5ryW4M6I7aTvLnHkquJkt3.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 8),
(365, 'posts/photos/3zHrdX8ancrKWcJRNjvmBVjng06ln8cX7klPAQlj.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 9),
(366, 'posts/photos/Ea0e6l2yKahSq9HMeKuQEvkU4JYLl2tZ62ukUz4b.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 10),
(367, 'posts/photos/YkafB9RaNFgbC7GTomh60vH2QHxwsPLmCzdzcEFs.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 11),
(368, 'posts/photos/1VIWjF9deaFWAKgaGAJTyS5ec39nYfVcWFD38uSO.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 12),
(369, 'posts/photos/GFWaNW0OCwhH9Y44ch9aRGZ7I37uhMrEAIK3RisH.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 13),
(370, 'posts/photos/OEGHfKqmsbyEl3ArxGd6htbgiERLcM1c6ysEZWb8.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 14),
(371, 'posts/photos/R5q2mjQen8il2NkTiVSOZ2GlbUktXvwRztUBziLR.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 15),
(372, 'posts/photos/usfmrz5OEerejD0etM6t1y86FNylOGWamj2eDnRj.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 16),
(373, 'posts/photos/z8GR0fV04qrk1lJM41R3jyeAWGpsXV5apVtyeOJW.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 17),
(374, 'posts/photos/XuJJ97jd2IYG99ugznQBuCYYHbhs7fY5cH26tQDN.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 18),
(375, 'posts/photos/6xYtMnxcrDVsdLALVA8M8Ojk1nzgybKDRBLduvmM.jpg', 2, '2023-07-07 21:09:07', '2023-07-07 21:09:07', 19),
(400, 'posts/photos/L7Hyg18np32WhzcjTAQFIBxJpM1JOoMJSDOAIt3s.png', 19, '2023-07-22 22:33:57', '2023-07-22 22:36:26', 1),
(405, 'posts/photos/ZlD6OwxaUJAEmeIRWNnFo4NEWL01T6rvwFauz0ko.png', 19, '2023-07-22 22:33:57', '2023-07-22 22:36:26', 2),
(407, 'posts/photos/vluCcvNoUmzeyMimgezwwXsSTQRMqRyYCAxhZVbC.png', 19, '2023-07-22 22:36:26', '2023-07-22 22:36:26', 3),
(408, 'posts/photos/kB1kq7lKjvenasbOXFu8XasYUQL0zbE29WysNqRZ.png', 19, '2023-07-22 22:36:26', '2023-07-22 22:36:26', 4),
(424, 'posts/photos/JeGvegssU3lBXECIWVqjncJ0lSmfHbse9CPNrkcy.jpg', 16, '2023-08-31 02:23:33', '2023-09-16 00:32:31', 5),
(425, 'posts/photos/FSts2Vwy5AyPaVmMoQzdWzhtzZX0e9tvuBFoMrsl.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 6),
(426, 'posts/photos/LBMaeCLsJREIHvEgEWqRchcXRdZ3InxCyycYj4TI.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 7),
(427, 'posts/photos/oRetXlFOAp2weIRto2vEgqRLkJaiG9oZtacMIDQK.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 8),
(428, 'posts/photos/P1ODcP6Q2VfgIflq443Q4jml3xmjjp8egH9o5zwQ.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 9),
(430, 'posts/photos/ZIwF8T03j2ASl99oYhFj36BUSPsqriLYnp5Bmbdl.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 10),
(431, 'posts/photos/noZ99OfyF6Wya45pZhTWZdPd5dZ6inkZqjopNMqR.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 11),
(432, 'posts/photos/yVWXddwae0UNo6BGMVqDnYB6XAXIqkzod9bCcjIN.jpg', 16, '2023-08-31 02:23:34', '2023-09-16 00:32:31', 12),
(434, 'posts/photos/fmXKAFB8Wd185qcKJCzNfSbdUCNrVoL8PVXEhXU1.jpg', 18, '2023-09-16 01:41:33', '2023-09-16 01:45:07', 1),
(435, 'posts/photos/WkKg5hZuHmc6KpeFAIX643JjMVRoLhclw5MvxG2m.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 2),
(436, 'posts/photos/oFUs3CwOff4ka6KRSE4bGZERxW0aErBGeQxpCJH4.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 3),
(437, 'posts/photos/E1LLpC9U5Ecw5XJzoB3nfQnyZv3xhXu8umFpDqDa.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 4),
(438, 'posts/photos/mFrM2d5tPD8RbgZvVrpa4KG3GpzJsfcOSIupWl5y.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 5),
(439, 'posts/photos/IevPWhesE3nE2tWrA0TUyASPirrndiqyRps7q6gb.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 6),
(440, 'posts/photos/u29uSqVBZPmEqM0P3ccaDdHRb6mKCaUwgfOoaroB.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 7),
(441, 'posts/photos/4uRv4nJE8f5RVWVy7N0VmFNtMQf59TekNZhw0IfH.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 8),
(442, 'posts/photos/NneNeNCC2hlfOc2gAofro2uydgclT6AUGCDCu7JE.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 9),
(443, 'posts/photos/zo6U7vlWZixDoOJ6uMBU1IQO1EaTcS8SjvJu47Ok.webp', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 10),
(444, 'posts/photos/js4u0dRhn0bOSDhkH9yGu37YYn9XSKmF9WUxCBtt.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 11),
(445, 'posts/photos/p2yItvEIYlGckA6bBMJ5Vp3xAbbDLfr6uQywOYjM.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 12),
(446, 'posts/photos/X9HfOrg1QTKppk1NoYbqAZ921Sg1MF8POGKX0X7A.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 13),
(447, 'posts/photos/4rFxLcMrBo68v70w5YK49J5tqSCDqMxRjvAr95ge.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 14),
(448, 'posts/photos/TqwGIz2ain54b8qW1j4kKHDvwWpzsHdJQR6qKk3T.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 15),
(449, 'posts/photos/BQshz1nuy6hDqgKjIUnAaTeKNdVDYLlwazYjwN9M.jpg', 18, '2023-09-16 01:44:15', '2023-09-16 01:45:07', 16);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `deleted_at`) VALUES
(1, 8, 2, NULL),
(2, 17, 1, NULL),
(3, 18, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', 'Administrador geral', '2023-04-19 03:50:58', '2023-04-19 03:50:58', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tags`
--

INSERT INTO `tags` (`id`, `title`, `description`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Alto Padrao', 'Alto Padrao', 'alto-padrao', '2023-07-04 15:39:16', '2023-07-04 15:39:16', NULL),
(2, 'Medio Padrao', 'Medio Padrao', 'medio-padrao', '2023-07-04 15:39:27', '2023-07-04 15:39:27', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mayrcon', 'mayrcon_marlon@hotmail.com', NULL, '$2y$10$muv5CJo29yup7b5wKaJSWe3ei6srQBTyBOcHtvObGJD7DA/OOqXUe', 'gFG5DXuREYKM1LLPYCO1c1Zg6QkELGEqMI6Wc5EG5JgxNyluryH3QJiqUY3H', '2023-04-19 03:50:58', '2023-06-05 13:34:05', NULL),
(2, 'Vinícius Araújo', 'viniciusaraujoimoveis@gmail.com', NULL, '$2y$10$FZN0FNJPHuNkynobpuQJJu1RAH0mtKiach6k4Q/2UK5FlM8K6RlOC', 'JGxGe2xWkLJTN9fyn4TTs4XQbE8tXMFmsvfViyGZUDCFHrPonKzBIS6rcnuA', '2023-04-20 02:29:24', '2023-04-20 02:29:24', NULL),
(3, 'Denio Rebouças', 'denio.reboucas@gmail.com', NULL, '$2y$10$5Y8VOxUwodWQgVpURTyICe0arB5w23mUbpBVKYgDurJd3pRTC9EcW', NULL, '2023-08-03 00:31:33', '2023-08-03 00:31:33', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`);

--
-- Índices para tabela `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`),
  ADD KEY `category_post_category_id_foreign` (`category_id`);

--
-- Índices para tabela `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_title_unique` (`title`),
  ADD KEY `cities_user_id_foreign` (`user_id`);

--
-- Índices para tabela `city_neighborhoods`
--
ALTER TABLE `city_neighborhoods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city_neighborhoods_title_unique` (`title`),
  ADD KEY `city_neighborhoods_city_id_foreign` (`city_id`);

--
-- Índices para tabela `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Índices para tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_city_id_foreign` (`city_id`),
  ADD KEY `posts_city_neighborhoods_id_foreign` (`city_neighborhoods_id`);

--
-- Índices para tabela `post_photos`
--
ALTER TABLE `post_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_photos_post_id_foreign` (`post_id`);

--
-- Índices para tabela `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Índices para tabela `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_title_unique` (`title`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `city_neighborhoods`
--
ALTER TABLE `city_neighborhoods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `post_photos`
--
ALTER TABLE `post_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT de tabela `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `city_neighborhoods`
--
ALTER TABLE `city_neighborhoods`
  ADD CONSTRAINT `city_neighborhoods_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_city_neighborhoods_id_foreign` FOREIGN KEY (`city_neighborhoods_id`) REFERENCES `city_neighborhoods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `post_photos`
--
ALTER TABLE `post_photos`
  ADD CONSTRAINT `post_photos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
