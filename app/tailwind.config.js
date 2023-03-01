/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './app/**/*.{js,ts,jsx,tsx}',
        './pages/**/*.{js,ts,jsx,tsx}',
        './components/**/*.{js,ts,jsx,tsx}',

        // Or if using `src` directory:
        './src/**/*.{js,ts,jsx,tsx}',
    ],
    theme: {
        extend: {
            fontSize: {
                padrao: '16px',
                '10px': '10px',
                '11px': '10px',
                '12px': '12px',
                '14px': '14px',
                '16px': '16px',
                '20px': '20px',
            },
            spacing: {
                // espaço para utilizar a margim e padding
                '10px': '10px',
                '20px': '20px',
                '30px': '30px',
                '40px': '40px',
            },
            textColor: {
                normal: '#393939',
                light: '#f5f5f5',
                dark: '#000000',
                medium: '#7a7a7a',
            },
            colors: {
                verde: {
                    1: '#005C53',
                    2: '#21998D',
                    3: '#9FC131',
                },
                cinza: {
                    1: '#9AAFBC',
                    2: '#BED1DD',
                    3: '#F8F8F8',
                    4: '#F1F9F8',
                },
            },
        },
    },
    plugins: [require('@tailwindcss/forms')],
};
