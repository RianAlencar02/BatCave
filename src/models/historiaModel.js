var database = require("../database/config");

function buscarHistorias(filtro, tipo) {
  // Preparando a query para criar um usuário.
  let filtragem;
  let tipagem = "";

  if (filtro == "Mais recentes"){
    filtragem = "ORDER BY h.anoHistoria DESC;"
  }
  else if (filtro == "Mais antigos"){
    filtragem = "ORDER BY h.anoHistoria ASC"
  }
  else if (filtro == "Mais bem avaliados"){
    filtragem = "ORDER BY notaAvaliacao DESC;"
  }
  else {
    filtragem = "ORDER BY h.tituloHistoria ASC;"
  }

  if (tipo == "Quadrinhos"){
    tipagem  = "WHERE h.tipoHistoria = 'Quadrinho'"
  }
  else if (tipo == "Filmes"){
    tipagem  = "WHERE h.tipoHistoria = 'Filme'"
  }
  else if (tipo == "Jogos"){
    tipagem  = "WHERE h.tipoHistoria = 'Jogo'"
  }

  let querySQL = `SELECT h.*, (SELECT IFNULL(ROUND(AVG(notaAvaliacao), 1), 0) FROM avaliacaoHistoria WHERE fkHistoria = h.idHistoria) AS notaAvaliacao
   FROM historia AS h ${tipagem} ${filtragem}`;
  console.log(
    "Executando a query para buscar todas as historias: \n" + querySQL,
  );
  return database.executar(querySQL);
}

function buscarHistoriaEspecifica(idHistoria) {
  // Preparando a query para logar.
  let querySQL = `SELECT h.*,
       comenEditor.textoComentarioEditor,
       (SELECT IFNULL(ROUND(AVG(notaAvaliacao), 1), 'Nenhuma Avaliação') FROM avaliacaoHistoria WHERE fkHistoria = h.idHistoria) AS notaAvaliacao,
       (SELECT COUNT(*)           FROM avaliacaoHistoria WHERE fkHistoria = h.idHistoria) AS totalAvaliacoes
FROM historia AS h
LEFT JOIN comentarioEditor AS comenEditor ON comenEditor.fkHistoria = h.idHistoria
  WHERE h.idHistoria = ${idHistoria};`;
  return database.executar(querySQL);
}

function contarHistorias() {
  let querySQL = `SELECT COUNT(idHistoria) AS qntHistorias FROM historia;`;

  return database.executar(querySQL);
}

function top3MelhorAvaliadas(){
    let querySQL = `SELECT h.idHistoria, h.tituloHistoria, h.bannerHistoria, ROUND(AVG(a.notaAvaliacao),1) AS notaHistoria, COUNT(a.fkHistoria) AS qntAvaliacoes FROM historia AS h
    INNER JOIN avaliacaoHistoria AS a ON h.idHistoria = a.fkHistoria
    GROUP BY h.idHistoria,h.tituloHistoria,h.bannerHistoria
    ORDER BY notaHistoria DESC
    LIMIT 3;`;
  return database.executar(querySQL);
}

function favoritosPorTipo(){
    let querySQL = `SELECT h.tipoHistoria, COUNT(a.fkHistoria) AS qntAvaliacoes FROM historia AS h
    JOIN avaliacaoHistoria AS a ON a.fkHistoria = h.idHistoria
    GROUP BY h.tipoHistoria;`;
  return database.executar(querySQL);
}

function selecionarTodasHistorias(){
  let querySQL = `SELECT h.*,  CASE
    WHEN ROUND(AVG(a.notaAvaliacao),1) > 0 THEN ROUND(AVG(a.notaAvaliacao),1)
    ELSE 'Nenhuma avaliação'
    END  AS notaHistoria FROM historia AS h
    LEFT JOIN avaliacaoHistoria AS a ON h.idHistoria = a.fkHistoria
    GROUP BY h.idHistoria,h.tituloHistoria,h.bannerHistoria`;
  return database.executar(querySQL);
}

module.exports = {
  buscarHistorias,
  buscarHistoriaEspecifica,
  contarHistorias,
  favoritosPorTipo,
  top3MelhorAvaliadas,
  selecionarTodasHistorias
};
