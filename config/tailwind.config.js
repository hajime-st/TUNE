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
        meiryo: "HiraKakuProN-W6",
        arial: "Arial Black",
        serif: "sans-serif",
        verdana: "Verdana",
        comic: "Comic Sans MS",
      },
    },
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
    require("daisyui"),
  ],
  daisyui: {
    themes: ["light"],
    darkTheme: "light",
  }
}