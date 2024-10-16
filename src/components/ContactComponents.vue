<template>
    <div>
        <div
            class="md:m-20 mt-20 flex flex-col items-center rounded-lg md:flex-row max-w-full h-full dark:bg-gray-800 dark:hover:bg-gray-700">

            <div class="flex flex-col justify-between p-4 leading-normal w-full break-all">

                <!-- Text Content -->
                <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Lorem ipsum dolor sit
                    amet.</h5>
                <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Lorem, ipsum dolor sit amet consectetur
                    adipisicing elit. Quod totam vitae eos eveniet. Quis consequatur quas dolor vitae laboriosam,
                    asperiores praesentium aut modi tenetur odio, error officiis nemo ducimus quia voluptates! Rem modi
                    distinctio laborum ut earum illo consequuntur. Beatae.</p>
            </div>

            <!-- Form -->
            <div class="flex md:h-auto p-4 leading-normal w-full shadow bg-gray-50 rounded-lg">
                <form class="w-full md:w-96 md:mr-44 mx-auto">

                    <div class="grid md:grid-cols-2 md:gap-6">
                        <div class="relative z-0 w-full mb-5 group">
                            <input type="text" name="floating_first_name" id="floating_first_name"
                                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_first_name"
                                class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">First
                                name</label>
                        </div>

                        <div class="relative z-0 w-full mb-5 group">
                            <input type="text" name="floating_last_name" id="floating_last_name"
                                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_last_name"
                                class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Last
                                name</label>
                        </div>
                    </div>

                    <div class="relative z-0 w-full mb-5 group">
                        <input type="email" name="floating_email" id="floating_email"
                            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                            placeholder=" " required />
                        <label for="floating_email"
                            class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                            address</label>
                    </div>

                    <div class="grid grid-cols-3 md:gap-6">
                        <div class="relative z-0 w-full mb-5 group">
                            <div class="flex items-center">
                                <button id="dropdown-phone-button" data-dropdown-toggle="dropdown-phone"
                                    class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-s-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600"
                                    type="button">
                                    +62 <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="m1 1 4 4 4-4" />
                                    </svg>
                                </button>
                                <div id="dropdown-phone"
                                    class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-full dark:bg-gray-700">
                                    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200"
                                        aria-labelledby="dropdown-phone-button">
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    Indonesian (+62)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    United States (+1)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    United Kingdom (+44)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    Australia (+61)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    Germany (+49)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    France (+33)
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button type="button"
                                                class="inline-flex w-full px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem">
                                                <span class="inline-flex items-center">
                                                    Germany (+49)
                                                </span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="relative z-0 w-full mb-5 group col-span-2">
                            <input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" name="floating_phone"
                                id="floating_phone"
                                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                                placeholder=" " required />
                            <label for="floating_phone"
                                class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Phone
                                number</label>
                        </div>
                    </div>

                    <div class="relative z-0 w-full mb-5 group">

                        <label for="message" class="block mb-2 text-sm font-medium text-gray-400 dark:text-white">Your
                            message</label>
                        <textarea id="message" rows="4"
                            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="How Can We Help You..?"></textarea>

                    </div>

                    <button type="submit"
                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
                </form>
            </div>

        </div>
    </div>
</template>

<script>
export default {
name: 'ContactComponents'
}
</script>