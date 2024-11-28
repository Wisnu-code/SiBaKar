<script setup lang="ts">
import HomeComponents from '../components/HomeComponents.vue'
import NavbarComponents from '../components/NavbarComponents.vue'
import ContactComponents from '../components/ContactComponents.vue';
import FooterComponents from '@/components/FooterComponents.vue';
import {onMounted, ref} from 'vue'

const isLoading = ref(true)

onMounted(() => {
  setTimeout(() => {
    isLoading.value = false
  }, 500)
})
</script>

<template>
  <div v-if="isLoading" class="flex justify-center items-center h-screen w-screen">
    <span class="bg-gray-50 rounded-xl shadow-xl w-1/2 h-1/2 text-xl font-bold flex justify-center items-center " disabled>
      <svg class="animate-spin h-10 w-10 mr-3 bg-gray-700 rounde-lg" viewBox="0 0 24 24">
        <!-- ... -->
      </svg>
      Processing...
    </span>    
  </div>

  <div v-else>
    <NavbarComponents />
    
    <HomeComponents />

    <ContactComponents />

    <FooterComponents />
  </div>
</template>
