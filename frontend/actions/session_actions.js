import * as SessionApiUtil from "../util/session_api_util";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";
import * as cartAPIUtil from "../util/cart_api_util";
import { fetchCart, receiveCart } from "./carts_actions";

//wrtie action creators
export const receiveCurrentUser = (currentUser) => ({
    type: RECEIVE_CURRENT_USER,
    currentUser
})

export const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
})
export const receiveErrors = (errors) => ({
    type: RECEIVE_SESSION_ERRORS,
    errors
})

//thunk action creator
export const login = (user) => dispatch => (
    SessionApiUtil.$login(user)
        .then(res =>  dispatch(receiveCurrentUser(res)),
        error => 
            dispatch(receiveErrors(error.responseJSON)),
        // user.id => (dispatch(receiveCart))
        )
        .then(user => dispatch(fetchCart(user.id)))
    // cartAPIUtil.$receiveCart(user.id)
    //     .then( cart => dispatch(receiveCart(cart)))
)

export const logout = () => dispatch => (
    SessionApiUtil.$logout()
        .then(() => dispatch(logoutCurrentUser()),
    error => (
        dispatch(receiveErrors(error.responseJSON))
    ))
)

export const signup = (user) => dispatch => {

    return(
        SessionApiUtil.$signup(user)
            .then(res => dispatch(receiveCurrentUser(res)),
        error => (
            dispatch(receiveErrors(error.responseJSON))
        ))
            .then(user => dispatch(fetchCart(user.id)))
    )
}

