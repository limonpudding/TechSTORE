import {SetBrandsAction} from "../actions/brands";

const initialState = {
    brands: []
}

export default function (state = initialState, action) {
    switch (action.type) {
        case SetBrandsAction: return {
            ...state,
            brands: action.payload
        }
        default:
            return state;
    }
}


