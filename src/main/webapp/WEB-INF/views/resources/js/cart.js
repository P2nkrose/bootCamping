async function deleteCart(cartid) {
    const result = await axios.delete(`/deletecart/${cartid}`)
    return result;
}