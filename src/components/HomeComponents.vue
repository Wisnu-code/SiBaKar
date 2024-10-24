<template>
    <div class="">
        <div
            class="blockT md:m-20 mt-20 flex flex-col items-center rounded-lg shadow bg-primary md:flex-row max-w-full md:min-h-96">

            <div class="flex flex-col justify-between items-center md:h-auto p-4 leading-normal w-full">

                <div class="max-w-full h-auto flex justify-between flex-col">

                    <!-- Text Content -->
                    <h5 class="slides mb-2 text-4xl md:text-6xl text-justify font-extrabold tracking-tight text-white">Atur dan pesan tempat kerja anda dengan mudah.</h5>

                    <!-- Button -->
                    <router-link to="/service" class="slides shadow-md bg-button max-w-full md:w-2/5 w-full rounded-xl pl-15 p-2 mt-14">
                        <button type="button" class="learn-more">
                            <span class="circle" aria-hidden="true">
                                <span class="icon arrow"></span>
                            </span>
                            <span class="button-text">Selanjutnya</span>
                        </button>
                    </router-link>

                </div>
                
            </div>

            <!-- Img -->
            <div class="slides flex max-h-full pr-10 mt-10">
                <img class="object-cover w-full h-auto rounded-t-lg md:mr-10 md:w-fit md:rounded-none md:rounded-s-lg"
                    src="../assets/undraw_favourite_item_pcyo1.png" alt="">
            </div>
        </div>

        <!-- Tampilan Jumlah -->
        <div class="zoom mt-20 max-w-full h-auto p-4 text-center bg-secondary  border rounded-lg shadow sm:p-8 md:mx-20">
            <div class="flex items-center justify-evenly md:gap-10 md:flex-row flex-col">
                <div class="zoom mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-white ">Seat</div>
                </div>
                <div class="zoom mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-white ">Floor</div>
                </div>
                <div class="zoom mb-3 text-4xl md:text-6xl font-bold text-gray-50 ">
                    150
                    <div class="zoom zoomS md:text-3xl text-2xl font-bold text-white ">Person</div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    name: 'HomeComponents'
}
</script>

<style>
@keyframes zoomIn {
    from {
        opacity: 0;
        transform: scale(.8);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.zoom {
    animation: zoomIn ease-in-out;
    animation-timeline: view();
    animation-range: entry 0% cover 40%;
}
</style>

<style scoped>
button {
    position: relative;
    display: inline-block;
    cursor: pointer;
    outline: none;
    border: 0;
    vertical-align: middle;
    text-decoration: none;
    background: transparent;
    padding: 0;
    font-size: inherit;
    font-family: inherit;
}

button.learn-more {
    width: 12rem;
    height: auto;
}

button.learn-more .circle {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: relative;
    display: block;
    margin: 0;
    width: 3rem;
    height: 3rem;
    background: white;
    border-radius: 1.625rem;
}

button.learn-more .circle .icon {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    bottom: 0;
    margin: auto;
    background: black;
}

button.learn-more .circle .icon.arrow {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    left: 0.625rem;
    width: 1.125rem;
    height: 0.125rem;
    background: none;
}

button.learn-more .circle .icon.arrow::before {
    position: absolute;
    content: "";
    top: -0.29rem;
    right: 0.0625rem;
    width: 0.625rem;
    height: 0.625rem;
    border-top: 0.125rem solid black;
    border-right: 0.125rem solid black;
    transform: rotate(45deg);
}

button.learn-more .button-text {
    transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 0.75rem 0;
    margin: 0 0 0 1.85rem;
    color: white;
    font-weight: 700;
    line-height: 1.6;
    text-align: center;
    text-transform: uppercase;
}

button:hover .circle {
    width: 100%;
    z-index: 10;
}

button:hover .circle .icon.arrow {
    background: black;
    transform: translate(1rem, 0);
}

button:hover .button-text {
    opacity: 0;
    transition: 0.5s;
}

body {
    background-color: black;
}
</style>