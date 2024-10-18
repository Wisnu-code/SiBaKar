<template>
    <!-- component -->
    <div class="blockT flex h-screen bg-sky-100">
        <!-- Left: Image -->
        <div class="w-1/2 h-screen hidden lg:flex justify-center items-center bg-yellow-300">
            <img src="../assets/relax.png" alt="Placeholder Image" class="object-contain w-1/2 h-auto">
        </div>
        <!-- Right: Login Form -->
        <div class="lg:p-36 md:p-52 sm:20 p-8 w-full lg:w-1/2 bg-white">
            <h1 class="text-2xl font-semibold mb-4">Register</h1>
            <form action="#" method="POST">
                <!-- Username Input -->
                <div class="mb-4" bg-sky-100>
                    <label for="username" class="block text-gray-600">Username</label>
                    <input type="text" id="username" name="username"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4" bg-sky-100>
                    <label for="username" class="block text-gray-600">Email</label>
                    <input type="text" id="username" name="username"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Password Input -->
                <div class="mb-4">
                    <label for="password" class="block text-gray-800">Password</label>
                    <input type="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-gray-800">Ulangi Password</label>
                    <input type="password" id="password" name="password"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        autocomplete="off">
                </div>
                <!-- Remember Me Checkbox -->
                <div class="mb-4 flex items-center">
                    <input type="checkbox" id="remember" name="remember" class="text-red-500">
                    <label for="remember" class="text-green-900 ml-2">Remember Me</label>
                </div>
                <!-- Forgot Password Link
                <div class="mb-6 text-blue-500">
                    <a href="#" class="hover:underline">Forgot Password?</a>
                </div> -->
                <!-- Login Button -->
                <button type="submit"
                    class="bg-red-500 hover:bg-blue-600 text-white font-semibold rounded-md py-2 px-4 w-full">Daftar</button>
            </form>
            <!-- Sign up  Link
            <div class="mt-6 text-green-500 text-center">
                <a href="#" class="hover:underline">Sign up Here</a>
            </div> -->
        </div>
    </div>
</template>