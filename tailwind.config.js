/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      daisyui: {
        themes: ["light", "dark", "cupcake"],
      },
    },
  },
  plugins: [
    require('flowbite/plugin'),
    // require('daisyui'),
  ],
}

