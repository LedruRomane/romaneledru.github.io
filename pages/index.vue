<template>
  <div id="buy">
    <div class="content_buy">
      <div>
        <b-card title="Buy">
          <b-card-text>
            I want to buy
          </b-card-text>

          <b-card-text>
            I want to spend
          </b-card-text>
          <b-input-group>
            <b-form-input></b-form-input>
            <template #append>
              <b-dropdown text={{}} variant="success">
                <b-dropdown-item>Action A</b-dropdown-item>
                <b-dropdown-item>Action B</b-dropdown-item>
              </b-dropdown>
            </template>
          </b-input-group>
          <b-card-text>
            For this much
          </b-card-text>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
}
</script>

<style scoped>
#buy {
  display: flex;
  justify-content: center;
  margin-top:3%;
}
.content_buy{
  max-width: 410px;
  background-color: beige;
}
h2{
  padding: 0px 10px;
  height: 80px;
}
</style>
