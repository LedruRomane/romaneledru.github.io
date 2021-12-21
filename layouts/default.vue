<template>
  <div>
    <Navbar />
    <Nuxt />
  </div>
</template>

<script>
import Navbar from "../components/Navbar";
export default {
  name: "Default",
  components: {Navbar},
}
</script>
