class SpecialHeader extends HTMLElement {
    connectionCallback(){
        this.innerHTML=`
        <p>hello</p>

        `
    }
}

// class SpecialFooter extends HTMLElement {
//     connectionCallback(){
//         this.innerHTML=`
//         <p></p>
//         `
//     }
// }

costumElements.define('special-header', SpecialHeader)
// costumElements.define('special-footer', SpecialFooter)