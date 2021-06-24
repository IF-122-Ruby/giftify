const { environment } = require('@rails/webpacker')

module.exports = environment

environment.config.merge({
  output: {
    library: ['packs', '[name]'],
    libraryTarget: 'var'
  },
})
