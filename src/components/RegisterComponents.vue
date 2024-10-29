<template>
    <!-- component -->
    <div class="flex justify-center items-center h-screen bg-sky-100">
        <!-- Left: Login Form -->
        <div class="md:ml-10 lg:p-20 p-8 h-full w-full lg:w-1/2 bg-white">
            <h1 class="text-3xl md:text-5xl md:font-bold font-semibold mb-4">Register</h1>
            <form action="" method="POST">
                <!-- Username Input -->
                <div class="mb-4" bg-sky-100>
                    <label for="username" class="block text-lg font-semibold md:text-2xl text-gray-600">Username</label>
                    <input type="text" id="username" name="username"
                        class="block text-lg font-semibold md:text-2xl py-2.5 px-0 w-full text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4" bg-sky-100>
                    <label for="fullname" class="block text-lg font-semibold md:text-2xl text-gray-600">Fullname</label>
                    <input type="text" id="fullname" name="fullname"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Password Input -->
                <div class="mb-4 relative">
                    <label for="password" class="block text-lg font-semibold md:text-2xl text-gray-600">Password</label>
                    <input type="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4 relative">
                    <label for="password" class="block text-lg font-semibold md:text-2xl text-gray-600">Ulangi Password</label>
                    <input type="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-lg font-semibold md:text-2xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Remember Me Checkbox -->
                <div class="mb-4 flex items-center text-lg font-semibold md:text-2xl">
                    <input type="checkbox" id="remember" name="remember" class="text-red-500 md:w-[4%] md:h-5 md:mt-1">
                    <label for="remember" class="text-green-900 ml-2">Ingat Saya</label>
                </div>
                <!-- Login Button -->
                <button type="submit" class="relative text-lg md:text-2xl md:font-bold font-semibold rounded-md h-[50px] w-full overflow-hidden bg-white text-green-900 hover:scale-105 hover:shadow-lg transition-all before:absolute before:left-0 before:right-0 before:top-0 before:h-0 before:w-full before:bg-green-900 before:duration-500 after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0 after:w-full after:bg-green-900 after:duration-500 hover:text-white hover:shadow-green-900 hover:before:h-2/4 hover:after:h-2/4"><span class="relative z-10">Daftar</span></button>
            </form>

            <!-- Untuk beralih kehalaman login -->
            <div class="mt-6 text-green-500 text-center text-lg md:text-2xl md:font-bold font-semibold">
                <router-link to="/login">
                    <button class="relative h-[50px] w-40 overflow-hidden text-green-400 transition-all before:absolute before:left-0 before:top-0 before:h-full before:w-0 before:duration-500 after:absolute after:right-0 after:top-0 after:h-full after:w-0 after:duration-500 hover:text-white hover:shadow-green-400 hover:before:w-2/4 hover:before:bg-green-400 hover:after:w-2/4 hover:after:bg-green-400 hover:scale-105 hover:shadow-lg"><span class="relative z-10">Masuk Di Sini</span></button>
                </router-link>
            </div>
        </div>

        <!-- Right: Image -->
        <div class="w-1/2 h-[80%] hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
</script>

<script>
const router = useRouter()
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            event.preventDefault(); // Mencegah reload halaman

            const username = document.getElementById('username').value;
            const fullname = document.getElementById('fullname').value;
            const password = document.getElementById('password').value;

            // Kirim data ke backend
            fetch('http://localhost:8080/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ username, fullname, password }),
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                // Tampilkan respons sukses
                alert('User registered: ' + JSON.stringify(data));
                router("/login")
                console.log("data",data)
            })
            .catch((error) => {
                alert('Error: ' + error.message);
            });
        });
    });
</script>
