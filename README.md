# README

# Weather API (Rails)

Esta é uma API simples construída em **Ruby on Rails** que retorna informações sobre o clima atual de um endereço utilizando as APIs **OpenCage** e **OpenWeather**.

## Funcionalidades

- Recebe um **endereço** como parâmetro.
- Realiza uma requisição ao serviço **OpenCage** para obter as coordenadas geográficas do endereço.
- Com as coordenadas, realiza uma requisição ao **OpenWeather** para obter as informações do clima.
- Retorna as informações do clima atual em formato JSON, incluindo a descrição do clima, temperatura e sensação térmica.

## Endpoints

### 1. `/weather`

#### Método: `GET`

Obtém as informações climáticas a partir de um **endereço**.

**Parâmetros de Consulta**:

- `address`: O endereço para o qual você deseja consultar o clima.

**Exemplo de Requisição**:

```
GET /weather?address=São+Paulo
```

**Exemplo de Resposta**:

```json
{
  "description": "few clouds",
  "temperature": 25.39,
  "feels_like": 25.76
}
```

## Como rodar localmente

### Pré-requisitos

- Ruby (versão 2.7 ou superior)
- Rails (versão 6 ou superior)
- Bundler

### Passos

1. **Clone o repositório** para sua máquina local.

```bash
git clone https://github.com/vitorchiari/weather_api.git
```

2. **Instale as dependências** do projeto.

```bash
cd weather-api
bundle install
```

3. **Configure suas chaves de API** para o OpenCage e OpenWeather no arquivo `.env`.

Crie um arquivo `.env` na raiz do projeto e adicione suas chaves de API:

```
OPENCAGE_API_KEY=your-opencage-api-key
OPENWEATHER_API_KEY=your-openweather-api-key
```

4. **Inicie o servidor Rails**.

```bash
rails server
```

A API estará rodando em `http://localhost:3000`.

### Testando a API

Agora, você pode testar a API acessando o endpoint `/weather` com um endereço como parâmetro. Exemplo:

```
http://localhost:3000/weather?address=São+Paulo
```

## Dependências

- **httparty**: Para realizar requisições HTTP aos serviços externos.
- **dotenv**: Para carregar as variáveis de ambiente de forma segura.
- **rails**: Framework para criar a API em Ruby on Rails.

## Serviços de API utilizados

- **OpenCage**: Para obter a geolocalização e as coordenadas do endereço.
  - [Documentação do OpenCage](https://opencagedata.com/)
  
- **OpenWeather**: Para obter as condições climáticas atuais com base nas coordenadas.
  - [Documentação do OpenWeather](https://openweathermap.org/api)

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
