let id = prompt("Enter your ID", "")
if (id == "Admin") {
    let password = prompt("Enter your password", "")
    if (password == "TheMaster") {
        alert("Welcome")
    } else if (password == "" || password == null) {
        alert("Cancelled")
    } else {
        alert("Access failure")
    }
} else if (id == "" || id == null) {
    alert("Cancelled")
} else {
    alert("Access failure")
}