module.exports = {
  type: 'object',
  properties: {
    safra: { type: 'integer', 
      minimum: 1900, 
      maximum: 2100 },
    preco_compra: { type: 'number',
      minimum: 0,
      maximum: 99999999.99
      },
    data_aquisicao: { type: 'string', format: 'date' },
    consumida: { type: 'boolean' },
    data_consumo: { type: 'string', format: 'date' },
    avaliacao: { type: 'integer',
      minimum: 0,
      maximum: 100
      },

  },
  required: ['safra', 'preco_compra', 'data_aquisicao'],
  additionalProperties: false,
};
