module.exports = {
  darkMode: false,
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        fancy: ["Dancing Script"],
        fantasy: "fantasy",
        meiryo: "HiraKakuProN-W6",
        arial: "Arial Black"
      },
    },
  },
  plugins: [
    require("daisyui")
  ],
  daisyui: {
    themes: ["light"],
    darkTheme: "light",
  }
}