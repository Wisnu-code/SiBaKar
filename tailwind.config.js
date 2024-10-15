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
      'primary' : '#1B78AF',
      'secondary' : '#EBC678',
      'bgChair' : '#DFE1E0',
      'pilar' : '#B4C6D0',
      'form' : '#D28782',
      'button' : '#FF6F3B',
      'buHov' : '#C63501'
    },
  },
  plugins: [
    require('flowbite/plugin'),
    // require('daisyui'),
  ],
}

