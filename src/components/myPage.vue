<template>
  <div class="myPage">
   <h1>{{msg}}</h1>
  </div>
</template> 

<script>
export default {
  name: 'myPage',
  data () {
    return {
      msg: 'Welcome to myPage'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

</style>
