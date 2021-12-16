<template>
  <div>
    <navbar></navbar>
    <buy id="buy"></buy>
    <swap id="swap"></swap>
  </div>

</template>

<script>
import Navbar from "../components/navbar";
import Buy from "../components/buy";
import Swap from "../components/swap";
export default {
  components: {Navbar, Buy, Swap}
}

</script>
<style>
</style>
