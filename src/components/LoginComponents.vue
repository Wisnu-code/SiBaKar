<template>
    <div class="flex justify-center items-center h-screen bg-sky-100 overflow-hidden">
        <!-- Left: Image -->
        <div
            class="w-1/2 h-[80%] max-h-screen hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl overflow-hidden transition duration-300 ease-in-out hover:scale-110 hover:shadow-xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="s-l object-contain w-1/2 h-auto">
        </div>
        <!-- Right: Login Form -->
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-3xl md:text-5xl md:font-bold font-semibold mb-4">
                <span class="capitalize">l </span><span class="capitalize">o </span><span class="capitalize">g </span><span class="capitalize">i </span><span class="capitalize">n </span>
            </h1>
            <form @submit.prevent="handleLogin">
                <!-- Username Input -->
                <div class="mb-4 s-r">
                    <label for="username" class="s-r-2 block text-lg font-semibold md:text-2xl text-gray-600">Username</label>
                    <input type="text" v-model="username" id="username" name="username"
                        class="s-r-3 block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Password Input -->
                <div class="mb-4 relative s-t">
                    <label for="password" class="s-t-2 block text-gray-600 font-semibold md:text-2xl text-lg">Password</label>
                    <input :type="isPasswordVisible ? 'text' : 'password'" v-model="password" id="password"
                        name="password"
                        class="s-t-3 block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                    <!-- Toggle Eye Icon -->
                    <span @click="togglePasswordVisibility" class="absolute right-2 md:top-12 top-10 text-2xl cursor-pointer text-gray-500">
                        <i :class="isPasswordVisible ? 'fa fa-eye' : 'fa fa-eye-slash'"></i>
                    </span>
                </div>

                <!-- Lupa Password -->
                <button class="fancy s-b hover:text-white hover:bg-black hover:rounded-2xl mb-2 bg-transparent box-border text-[#fff] inline-block float-right font-semibold tracking-tighter m-0 outline-none overflow-visible py-5 px-8 relative text-center no-underline normal-case select-none text-[13px]">
                    <span class="top-key h-[2px] w-6 -top-[2px] left-2 absolute bg-[#e8e8e8]"></span>
                    <span class="text text-[1.125em] leading-[1.33333em] block text-left uppercase no-underline text-black">Lupa Password</span>
                    <span class="bottom-key-1 h-[2px] w-6 right-7 -bottom-[2px] absolute bg-[#e8e8e8]"></span>
                    <span class="bottom-key-2 h-[2px] w-2 right-2 -bottom-[2px] absolute bg-[#e8e8e8]"></span>
                </button>

                <!-- Login Button -->
                <button type="submit"
                    class="relative text-lg md:text-2xl md:font-bold font-semibold rounded-md h-[50px] w-full overflow-hidden bg-white text-green-900 hover:scale-105 hover:shadow-lg transition-all before:absolute before:left-0 before:right-0 before:top-0 before:h-0 before:w-full before:bg-green-900 before:duration-500 after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0 after:w-full after:bg-green-900 after:duration-500 hover:text-white hover:shadow-green-900 hover:before:h-2/4 hover:after:h-2/4"><span
                        class="relative z-10 s-r">Masuk</span></button>
            </form>
            <!-- Sign up Link -->
            <div class="mt-6 text-green-500 text-center text-lg md:text-2xl md:font-bold font-semibold">
                <router-link to="/register">
                    <button
                        class="relative h-[50px] w-40 overflow-hidden text-green-400 transition-all before:absolute before:left-0 before:top-0 before:h-full before:w-0 before:duration-500 after:absolute after:right-0 after:top-0 after:h-full after:w-0 after:duration-500 hover:text-white hover:shadow-green-400 hover:before:w-2/4 hover:before:bg-green-400 hover:after:w-2/4 hover:after:bg-green-400 hover:scale-105 hover:shadow-lg"><span
                            class="relative z-10 s-b">Daftar Akun</span></button>

                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
import ScrollReveal from 'scrollreveal';
export default {
    data() {
        return {
            username: '',
            password: '',
            isPasswordVisible: false,
        };
    },
    methods: {
        async handleLogin() {
            try {
                const response = await fetch('http://localhost:8080/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        username: this.username,
                        password: this.password,
                    }),
                });

                if (!response.ok) {
                    throw new Error('Login failed: ' + response.statusText);
                }

                const data = await response.json();
                alert('Login successful!');

                // Simpan token ke localStorage atau Vuex untuk digunakan di bagian lain aplikasi
                localStorage.setItem('token', data.token);
                localStorage.setItem('user', JSON.stringify(data.user));
                // Redirect ke halaman lain setelah login
                this.$router.push('/service'); // Ganti '/dashboard' dengan rute yang sesuai

            } catch (error) {
                alert('Error: ' + error.message);
            }
        },
        togglePasswordVisibility() {
            this.isPasswordVisible = !this.isPasswordVisible;
        },
    },
    mounted() {
        // Inisialisasi ScrollReveal
        ScrollReveal({
            duration: 1000, // Durasi animasi dalam milidetik
            distance: '60px', // Jarak elemen akan muncul
            delay: 300, // Jeda antara setiap animasi
            reset: true, // Jika true, animasi akan dijalankan lagi setiap kali elemen terlihat
        });
        ScrollReveal().reveal('.s-l', { delay: 100, origin: 'left' });
        ScrollReveal().reveal('.s-r', { delay: 100, origin: 'right' });
        ScrollReveal().reveal('.s-r-2', { delay: 200, origin: 'right' });
        ScrollReveal().reveal('.s-r-3', { delay: 300, origin: 'right' });
        ScrollReveal().reveal('.s-t', { delay: 300, origin: 'top' });
        ScrollReveal().reveal('.s-t-2', { delay: 400, origin: 'top' });
        ScrollReveal().reveal('.s-t-3', { delay: 500, origin: 'top' });
        ScrollReveal().reveal('.s-b', { delay: 100, origin: 'bottom' });
        ScrollReveal().reveal('.s-b-4', { delay: 400, origin: 'bottom' });
        ScrollReveal().reveal('.capitalize', { delay: 300, origin: 'bottom', interval: 100 })
    },
};
</script>

<style scoped>
.fancy, .text {
    transition: all 0.3s ease-in-out;
}
.top-key {
    transition: width 0.5s ease-out, left 0.3s ease-out;
}
.bottom-key-1, .bottom-key-2 {
    transition: width 0.5s ease-out, right 0.3s ease-out;
}
.fancy:hover::before {
    width: 0.9375rem;
    background: white;
}
.fancy:hover .text {
    color: white;
    padding-left: 1.5em;
}
.fancy:hover .top-key {
    left: -2px;
    width: 0px;
}
.fancy:hover .bottom-key-1,
.fancy:hover .bottom-key-2 {
    right: 0;
    width: 0;
}
</style>