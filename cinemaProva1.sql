CREATE TABLE `Cinema` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `endereco` TEXT,
  `cidade` VARCHAR(100),
  `estado` VARCHAR(100),
  `cep` VARCHAR(20),
  `telefone` VARCHAR(20),
  `email` VARCHAR(100),
  `capacidade_total` INT
);

CREATE TABLE `Sala` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cinema_id` INT,
  `numero` INT,
  `capacidade` INT,
  `tipo` VARCHAR(50)
);

CREATE TABLE `Pessoa` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `nacionalidade` VARCHAR(100),
  `idade` INT,
  `tipo_pessoa` ENUM(ator,diretor)
);

CREATE TABLE `Filme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `titulo` VARCHAR(255),
  `titulo_traduzido` VARCHAR(255),
  `duracao` INT,
  `data_lancamento` DATE,
  `categoria_id` INT,
  `diretor_id` INT,
  `sinopse` TEXT
);

CREATE TABLE `Categoria` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` TEXT
);

CREATE TABLE `AtorFilme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ator_id` INT,
  `filme_id` INT,
  `papel` VARCHAR(255)
);

CREATE TABLE `Sessao` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `sala_id` INT,
  `filme_id` INT,
  `horario_inicio` DATETIME,
  `horario_fim` DATETIME,
  `preco` DECIMAL(10,2)
);

CREATE TABLE `Ingresso` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `sessao_id` INT,
  `tipo` ENUM(inteira,meia),
  `assento` VARCHAR(10),
  `valor_pago` DECIMAL(10,2)
);

CREATE TABLE `CinemaFilme` (
  `cinema_id` INT,
  `filme_id` INT,
  `PRIMARY` KEY(cinema_id,filme_id)
);

CREATE TABLE `AvaliacaoFilme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `filme_id` INT,
  `nota` INT,
  `comentario` TEXT,
  `data_avaliacao` DATETIME
);

CREATE TABLE `Funcionarios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cinema_id` INT,
  `nome` VARCHAR(255),
  `cargo` VARCHAR(100),
  `salario` DECIMAL(10,2),
  `data_contratacao` DATE
);

CREATE TABLE `GeneroFilme` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `filme_id` INT,
  `genero` VARCHAR(100)
);

ALTER TABLE `Sala` ADD FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`id`);

ALTER TABLE `Filme` ADD FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id`);

ALTER TABLE `Filme` ADD FOREIGN KEY (`diretor_id`) REFERENCES `Pessoa` (`id`);

ALTER TABLE `AtorFilme` ADD FOREIGN KEY (`ator_id`) REFERENCES `Pessoa` (`id`);

ALTER TABLE `AtorFilme` ADD FOREIGN KEY (`filme_id`) REFERENCES `Filme` (`id`);

ALTER TABLE `Sessao` ADD FOREIGN KEY (`sala_id`) REFERENCES `Sala` (`id`);

ALTER TABLE `Sessao` ADD FOREIGN KEY (`filme_id`) REFERENCES `Filme` (`id`);

ALTER TABLE `Ingresso` ADD FOREIGN KEY (`sessao_id`) REFERENCES `Sessao` (`id`);

ALTER TABLE `CinemaFilme` ADD FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`id`);

ALTER TABLE `CinemaFilme` ADD FOREIGN KEY (`filme_id`) REFERENCES `Filme` (`id`);

ALTER TABLE `AvaliacaoFilme` ADD FOREIGN KEY (`filme_id`) REFERENCES `Filme` (`id`);

ALTER TABLE `Funcionarios` ADD FOREIGN KEY (`cinema_id`) REFERENCES `Cinema` (`id`);

ALTER TABLE `GeneroFilme` ADD FOREIGN KEY (`filme_id`) REFERENCES `Filme` (`id`);
