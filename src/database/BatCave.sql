
CREATE DATABASE BatCave;

USE BatCave;

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY,
    nomeUsuario VARCHAR(45),
    emailUsuario VARCHAR(100),
    senhaUsuario VARCHAR(10)
);

CREATE TABLE historia (
    idHistoria INT PRIMARY KEY,
    nomeHistoria VARCHAR(100),
    anoHistoria DATE,
    tipoHistoria VARCHAR(10),
    criadorHistoria VARCHAR(45),
    generoHistoria VARCHAR(45),
    universoHistoria VARCHAR(45),
    imgCapaHistoria VARCHAR(100),
    imgHorizontalHistoria VARCHAR(100),
    sinopseHistoria VARCHAR(1500),
    resumoHistoria VARCHAR(100)
);

CREATE TABLE personagem (
    idPersonagem INT PRIMARY KEY,
    nomePersonagem VARCHAR(50),
    generoPersonagem VARCHAR(10),
    resumoPersonagem VARCHAR(100),
    identidadeSecretaPersonagem VARCHAR(50),
    primeiraAparicaoPersonagem VARCHAR(100),
    categoriaPersonagem VARCHAR(45),
    biografiaPersonagem VARCHAR(1500),
    imgCapaPersonagem VARCHAR(100),
    imgHorizontalPersonagem VARCHAR(100)
);

CREATE TABLE comentarioEditor (
    idcomentarioEditor INT PRIMARY KEY,
    comentario VARCHAR(1000),
    idHistoria INT,
    idPersonagem INT,
    FOREIGN KEY (idHistoria) REFERENCES historia(idHistoria),
    FOREIGN KEY (idPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE adm (
    idAdm INT PRIMARY KEY,
    nomeAdm VARCHAR(45),
    emailAdm VARCHAR(100),
    senhaAdm VARCHAR(10)
);

CREATE TABLE historiasFavoritadas (
    status BOOLEAN,
    idUsuario INT,
    idHistoria INT,
    PRIMARY KEY (idUsuario, idHistoria),
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (idHistoria) REFERENCES historia(idHistoria)
);

CREATE TABLE personagensFavoritados (
    idPersonagensFavoritados INT,
    status BOOLEAN,
    idUsuario INT,
    idPersonagem INT,
    PRIMARY KEY (idPersonagensFavoritados, idUsuario, idPersonagem),
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (idPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE quiz (
    idQuiz INT PRIMARY KEY,
    nomeQuiz VARCHAR(100),
    idHistoria INT,
    idPersonagem INT,
    FOREIGN KEY (idHistoria) REFERENCES historia(idHistoria),
    FOREIGN KEY (idPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE perguntaQuiz (
    idPerguntaQuiz INT PRIMARY KEY,
    descricaoPergunta VARCHAR(45),
    idQuiz INT NOT NULL,
    FOREIGN KEY (idQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativaPergunta (
    idAlternativaPergunta INT PRIMARY KEY,
    descricaoResposta VARCHAR(100),
    alternativaCorreta TINYINT,
    idPerguntaQuiz INT NOT NULL,
    FOREIGN KEY (idPerguntaQuiz) REFERENCES perguntaQuiz(idPerguntaQuiz)
);

CREATE TABLE avaliacaoHistoria (
    notaAvaliacao TINYINT,
    idHistoria INT,
    idUsuario INT,
    PRIMARY KEY (idHistoria, idUsuario),
    FOREIGN KEY (idHistoria) REFERENCES historia(idHistoria),
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE tentativa (
    idTentativa INT,
    idUsuario INT,
    idAlternativaPergunta INT,
    PRIMARY KEY (idTentativa, idUsuario, idAlternativaPergunta),
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (idAlternativaPergunta) REFERENCES alternativaPergunta(idAlternativaPergunta)
);
