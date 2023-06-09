async function customerDelete(i) {
    const result = await axios.delete(`/deleteCustomer/${i}`);
    return result;
}