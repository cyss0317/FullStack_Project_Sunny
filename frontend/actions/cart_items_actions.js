import * as CartItemsAPIUtil from "../util/cart_items_api_util"

export const CREATE_CART_ITEM = "CREATECARTITEM";
// export const RECEIVE_CART_ITEMS = "RECEIVECARTITEMS";
export const DELETE_CART_ITEM = "DELETECARTITEM";


export const createCartItem = (cartItem) => ({
    type: CREATE_CART_ITEM,
    cartItem
})
// export const receiveCartItems = (cartItems) =>  ({
//     type: RECEIVE_CART_ITEMS,
//     cartItems

// })
export const deleteCartItem = (cartItemId) => ({
    type: DELETE_CART_ITEM

})


export const ThunkCreateCartItem = (cartItem) => dispatch => (
    CartItemsAPIUtil.$createCartItem(cartItem)
        .then( cartItem => dispatch(createCartItem(cartItem)))
)

// export const ThunkReceiveCartItems = () => dispatch => (
//     CartItemsAPIUtil.$receiveCartItems()
//         .then( cartItems => dispatch(receiveCartItems(cartItems)))
// )

export const ThunkDeleteCartItem = (cartItemId) => dispatch => (
    CartItemsAPIUtil.$deleteCartItem(cartItemId)
        .then( () => dispatch(deleteCartItem(cartItemId)))
    )