
# Wattio - Desafio Técnico

Este projeto foi desenvolvido como parte de um teste técnico para uma vaga de Desenvolvedor Flutter.

## 🛠️ Tecnologias utilizadas

- **Flutter**: Framework utilizado para desenvolvimento mobile.
- **Provider**: Gerenciamento de estado da aplicação.
- **Node.js**: Backend criado para realizar os cálculos da aplicação.
  - **Node.js v22.15.0**
  - **NPM v11.3.0**

## 📦 Estrutura do Projeto

```
wattio_frontend_desafio/
├── server/       # Backend Node.js
└── flutter_app/  # Aplicação Flutter
```

## 🚀 Como rodar o projeto

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/wattio_frontend_desafio.git
cd wattio_frontend_desafio
```

### 2. Configuração e execução do Backend

1. Acesse o diretório do backend:

```bash
cd server
```

2. Instale as dependências:

```bash
npm install
```

3. Inicie o servidor:

```bash
npm start
```

🔴 **Observação importante:**  
Por padrão, a aplicação consome a API na URL `http://localhost:8000`.  
Caso esteja utilizando outro dispositivo ou precise acessar por outro IP, altere o arquivo `.env` no diretório do `flutter_app`:

```env
API_URL=http://SEU_IP:8000
```

Substitua `SEU_IP` pelo IP da sua máquina onde o servidor está rodando.

---

### 3. Configuração e execução da aplicação Flutter

1. Acesse o diretório da aplicação:

```bash
cd ../flutter_app
```

2. Instale as dependências do Flutter:

```bash
flutter pub get
```

3. Execute a aplicação:

```bash
flutter run
```

---

## 📊 Funcionamento da aplicação

- Todos os cálculos são realizados no serviço backend em Node.js.
- A aplicação Flutter consome os dados do backend via requisições HTTP.
- O backend responde com um **JSON**, que é utilizado para exibição na interface.
- O gerenciamento de estado da aplicação foi implementado utilizando o **Provider**, garantindo uma estrutura limpa e organizada.

---

## 💡 Considerações

- Certifique-se de que o backend esteja ativo antes de rodar a aplicação Flutter.
- Em caso de problemas de conexão, revise a configuração da variável `API_URL`.
- O backend escuta por padrão na porta `8000`.

---

## 👨‍💻 Desenvolvido por

João Vitor Santos Martins  
[LinkedIn](https://www.linkedin.com/in/joaovitorsmartins/)
