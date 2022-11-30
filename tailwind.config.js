module.exports = {
  daisyui: {
    themes: ["cupcake", "dark", "cmyk"],
  },
  plugins: [require("daisyui")],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
