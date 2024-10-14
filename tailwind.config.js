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
    colors: {
      // Configure your color palette here
      'primary' : '#00B7E6',
      'secondary' : '#FFBE00',
      'button' : '#FF6F3B',
      'buHov' : '#C63501'
    },
  },
  plugins: [
    require('flowbite/plugin'),
    // require('daisyui'),
  ],
}

