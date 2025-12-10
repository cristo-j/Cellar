const swaggerJsdoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Cellar - Controle de Adega Particular',
      version: '1.0.0',
      description: 'Documentação da API RESTful para gestão de adega particular.',
    },
    servers: [
      {
        url: 'http://localhost:3000', // A URL base do seu servidor (verifique em seu .env)
        description: 'Servidor de Desenvolvimento',
      },
    ],
    // Define o esquema de segurança para o Token JWT
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          description: 'Para acessar as rotas protegidas, insira o token no formato: Bearer [seu_token]'
        }
      },
      // Define os "objetos" que sua API usa
      schemas: {
        vinho: {
          type: 'object',
          required: ['nome', 'produtor'],
          properties: {
            id: { type: 'integer', description: 'ID do advogado', example: 1 },
            nome: { type: 'string', minLength: 1, description: 'Nome do vinho', example: 'Pêra Manca' },
            produtor: { type: 'string', minLength: 4, description: 'Produtor do vinho', example: 'Cartuxa' },
            pais_origem: { type: 'string', description: 'País de origem do vinho', example: 'Portugal' },
            tipo: { type: 'string', description: 'Tipo do vinho', example: 'Tinto' },
            uva_casta: { type: 'string', description: 'Tipo(s) de uva(s)', example: 'Blend (Aragonez e Trincadeira)' },
          }
        },
        Post_Edit_vinho: {
          type: 'object',
          required: ['nome', 'produtor'],
          properties: {
            id: { type: 'integer', description: 'ID do advogado', example: 1 },
            nome: { type: 'string', minLength: 1, description: 'Nome do vinho', example: 'Pêra Manca' },
            produtor: { type: 'string', minLength: 4, description: 'Produtor do vinho', example: 'Cartuxa' },
            pais_origem: { type: 'string', description: 'País de origem do vinho', example: 'Portugal' },
            tipo: { type: 'string', description: 'Tipo do vinho', example: 'Tinto' },
            uva_casta: { type: 'string', description: 'Tipo(s) de uva(s)', example: 'Blend (Aragonez e Trincadeira' },
          }
        },
        garrafa: {
          type: 'object',
          required: ['safra', 'preco_compra', 'data_aquisicao'],
          properties: {
            id: { type: 'integer', description: 'ID do garrafa' },
            id_advogado: { type: 'integer', description: 'ID do vinho' },
            safra: {
              type: 'integer',
              minimum: 1900,
              maximum: 2100, description: 'Safra da garrafa', example: '2021'
            },
            preco_compra: {
              type: 'number',
              multipleOf: 0.01,
              minimum: 0,
              maximum: 99999999.99, description: 'Preço da garrafa ', example: '5249,50'
            },
            data_aquisicao: { type: 'string', format: 'date', description: 'Data de aquisição da garrafa', example: '18/06/2022' },
            consumida: { type: 'boolean', description: 'Indicação se a garrafa foi consumida ou não', example: 'True' },
            data_consumo: { type: 'string', format: 'date', description: 'Data de consumo da garrafa', example: '08/12/2025' },
            avaliacao: {
              type: 'integer',
              minimum: 0,
              maximum: 100, description: 'Nota dada ao vinho daquela garrafa', example: '89'
            },
          }
        },
        Post_Edit_garrafa: {
          type: 'object',
          required: ['safra', 'preco_compra', 'data_aquisicao'],
          properties: {
            safra: {
              type: 'integer',
              minimum: 1900,
              maximum: 2100, description: 'Safra da garrafa', example: '2021'
            },
            preco_compra: {
              type: 'number',
              multipleOf: 0.01,
              minimum: 0,
              maximum: 99999999.99, description: 'Preço da garrafa ', example: '5249,50'
            },
            data_aquisicao: { type: 'string', format: 'date', description: 'Data de aquisição da garrafa', example: '18/06/2022' },
            consumida: { type: 'boolean', description: 'Indicação se a garrafa foi consumida ou não', example: 'True' },
            data_consumo: { type: 'string', format: 'date', description: 'Data de consumo da garrafa', example: '08/12/2025' },
            avaliacao: {
              type: 'integer',
              minimum: 0,
              maximum: 100, description: 'Nota dada ao vinho daquela garrafa', example: '89'
            },
          },
        },
        usuario: {
          type: 'object',
          required: ['nome', 'email', 'senha'],
          properties: {
            nome: { type: 'string', description: 'Nome do usuário', example: 'João' },
            email: { type: 'string', description: 'email do usuário', example: 'teste@gmail.com' },
            senha: { type: 'string', description: 'senha', example: 'minhasenha' },
          }
        },
        login: {
          type: 'object',
          required: ['email', 'senha'],
          properties: {
            email: { type: 'string', description: 'email do usuário', example: 'teste@gmail.com' },
            senha: { type: 'string', description: 'senha', example: 'minhasenha' },
          }
        }
      }
    }
  },
  // Caminho para os arquivos que contêm os comentários do Swagger
  apis: [
    './app/routes/*.js', // Aponta para todos os arquivos na sua pasta de rotas
  ],
};

const specs = swaggerJsdoc(options);

module.exports = specs;
