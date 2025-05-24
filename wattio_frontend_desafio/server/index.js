const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();
const data = require("./cooperativas.json");

server.use(middlewares);
server.use(jsonServer.bodyParser);
server.use((req, res, next) => {
  if (req.method === "POST") {
    req.body.createdAt = Date.now();
  }
  next();
});

server.get("/cooperativas", (req, res) => {
  res.jsonp(data.cooperativas);
});

server.post("/coop_list", (req, res) => {
  const { valor } = req.body;

  if (!valor) {
    return res.status(400).jsonp({ message: "Sem valor informado" });
  }

  if (!data) {
    return res.status(500).jsonp({ message: "Configuração de cooperativas ausente ou incorreta." });
  }

  const cooperativas = data.cooperativas.filter(coop =>
    coop.valorMinimoMensal <= valor && valor <= coop.valorMaximoMensal
  );

  if (cooperativas.length === 0) {
    return res.status(400).jsonp({ message: "Não existe cooperativa com esse valor mínimo" });
  }

  return res.jsonp(cooperativas);
});


server.post("/desconto", (req, res) => {
  const { valorMensal, porcentagemDesconto } = req.body;

  if (!valorMensal || !porcentagemDesconto) {
    return res.status(400).jsonp({ message: "Selecione uma oferta" });
  }

  const descontoMensal = valorMensal * (porcentagemDesconto / 100);
  const descontoAnual = descontoMensal * 12;
  return res.jsonp({ valorMensal: descontoMensal, valorAnual: descontoAnual });
});

// Use default router
server.use(router);
server.listen(8000, () => {
  console.log("JSON Server is running");
});