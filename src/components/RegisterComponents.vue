<template>
    <div class="blockT flex h-screen bg-sky-100">
        <div class="w-1/2 max-h-screen hidden lg:flex justify-center items-center bg-yellow-300 m-20 rounded-2xl">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-2xl font-semibold mb-4">Register</h1>
            <form @submit.prevent="handleSubmit">
                <div class="mb-4">
                    <label for="username" class="block text-gray-600">Username</label>
                    <input type="text" id="username" v-model="username" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" autocomplete="off">
                </div>
                <div class="mb-4">
                    <label for="fullname" class="block text-gray-600">Fullname</label>
                    <input type="text" id="fullname" v-model="fullname" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" autocomplete="off">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-gray-800">Password</label>
                    <input type="password" id="password" v-model="password" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" autocomplete="off">
                </div>
                <div class="mb-4">
                    <label for="confirmPassword" class="block text-gray-800">Ulangi Password</label>
                    <input type="password" id="confirmPassword" v-model="confirmPassword" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" autocomplete="off">
                </div>
                <div class="mb-4 flex items-center">
                    <input type="checkbox" id="remember" name="remember" class="text-red-500">
                    <label for="remember" class="text-green-900 ml-2">Remember Me</label>
                </div>
                <button type="submit" class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full">Daftar</button>
            </form>
        </div>
    </div>
</template>

<script>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

export default {
    setup() {
        const router = useRouter();
        const username = ref('');
        const fullname = ref('');
        const password = ref('');
        const confirmPassword = ref('');

        const handleSubmit = () => {
            // Kirim data ke backend
            fetch('http://localhost:8080/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ username: username.value, fullname: fullname.value, password: password.value }),
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                alert('User registered: ' + JSON.stringify(data));
                router.push("/login"); // Gunakan push untuk navigasi
            })
            .catch((error) => {
                alert('Error: ' + error.message);
            });
        };

        return {
            username,
            fullname,
            password,
            confirmPassword,
            handleSubmit,
        };
    }
};
</script>