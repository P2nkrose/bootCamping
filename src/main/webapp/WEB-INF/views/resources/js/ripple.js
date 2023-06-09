async function addRipple(replyObj){
    const response = await axios.post(`/customer/ripple/addRipple/`, replyObj);
    return response;
}


async function getListRipple(boardnum) {
    const response = await axios.get(`/customer/ripple/getListRipple/${boardnum}`);
    return response;
}


async function deleteRipple(rippleid){
    const response = await axios.delete(`/customer/ripple/deleteRipple/${rippleid}`);
    return response.data;
}