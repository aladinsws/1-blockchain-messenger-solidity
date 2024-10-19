(async () => {
    const address = '' // set your contract address
    const abiArray = []; // set your abi array

    const contractInstance = new web3.eth.Contract(abiArray, address)
    console.log(await contractInstance.methods.myUint().call())

    let accounts = await web3.eth.getAccounts()
    let txResutl = await contractInstance.methods
        .updateMyUint(123)
        .send({ from: accounts[0] })

    console.log(await contractInstance.methods.myUint().call())
    console.log(txResutl)
})()
