/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#00428E",
        primaryLight: "rgba(0, 66, 142, 0.1)",
        secondary: "#2197C9",
        grey: {
          0: "#111111",
          50: "#1A1A1A",
          100: "#303030",
          200: "#404040",
          300: "#696969",
          400: "#777777",
          500: "#A4A4A4",
          600: "#BEBEBE",
          700: "#EBEBEB",
          800: "#F0F0F0",
          900: "#FBFBFB",
          1000: "#FFFFFF",
        },
        bgModal: "rgba(15, 17, 20, 0.55)",
      },
    },
  },
  plugins: [],
};
