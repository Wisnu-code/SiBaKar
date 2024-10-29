<template>
    <div class="flex justify-center items-center h-screen bg-sky-100">
        <!-- Left: Image -->
        <div
            class="w-1/2 h-[80%] max-h-screen hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
        <!-- Right: Login Form -->
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-3xl md:text-5xl md:font-bold font-semibold mb-4">Login</h1>
            <form @submit.prevent="handleLogin">
                <!-- Username Input -->
                <div class="mb-4">
                    <label for="username" class="block text-lg font-semibold md:text-2xl text-gray-600">Username</label>
                    <input type="text" v-model="username" id="username" name="username"
                        class="block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Password Input -->
                <div class="mb-4 relative">
                    <label for="password" class="block text-gray-600 font-semibold md:text-2xl text-lg">Password</label>
                    <input :type="isPasswordVisible ? 'text' : 'password'" v-model="password" id="password"
                        name="password"
                        class="block py-2.5 px-0 w-full text-lg md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                    <!-- Toggle Eye Icon -->
                    <span @click="togglePasswordVisibility" class="absolute right-2 md:top-12 top-10 text-2xl cursor-pointer text-gray-500">
                        <i :class="isPasswordVisible ? 'fa fa-eye' : 'fa fa-eye-slash'"></i>
                    </span>
                </div>
                <!-- Login Button -->
                <button type="submit"
                    class="relative text-lg md:text-2xl md:font-bold font-semibold rounded-md h-[50px] w-full overflow-hidden bg-white text-green-900 hover:scale-105 hover:shadow-lg transition-all before:absolute before:left-0 before:right-0 before:top-0 before:h-0 before:w-full before:bg-green-900 before:duration-500 after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0 after:w-full after:bg-green-900 after:duration-500 hover:text-white hover:shadow-green-900 hover:before:h-2/4 hover:after:h-2/4"><span
                        class="relative z-10">Masuk</span></button>
            </form>
            <!-- Sign up Link -->
            <div class="mt-6 text-green-500 text-center text-lg md:text-2xl md:font-bold font-semibold">
                <router-link to="/register">
                    <button
                        class="relative h-[50px] w-40 overflow-hidden text-green-400 transition-all before:absolute before:left-0 before:top-0 before:h-full before:w-0 before:duration-500 after:absolute after:right-0 after:top-0 after:h-full after:w-0 after:duration-500 hover:text-white hover:shadow-green-400 hover:before:w-2/4 hover:before:bg-green-400 hover:after:w-2/4 hover:after:bg-green-400 hover:scale-105 hover:shadow-lg"><span
                            class="relative z-10">Daftar Akun</span></button>

                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
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
                alert('Login successful! Token: ' + data.token);

                // Simpan token ke localStorage atau Vuex untuk digunakan di bagian lain aplikasi
                localStorage.setItem('token', data.token);
                // Redirect ke halaman lain setelah login
                this.$router.push('/'); // Ganti '/dashboard' dengan rute yang sesuai

            } catch (error) {
                alert('Error: ' + error.message);
            }
        },
        togglePasswordVisibility() {
            this.isPasswordVisible = !this.isPasswordVisible;
        },
    },
};
</script>

<style scoped>
/* Tambahkan style jika perlu */
</style>
