const Spacehorse = artifacts.require("Spacehorse");
const truffleAssert = require("truffle-assertions");


contract("Spacehorse", (accounts) => {

    it("should credit an NFT to specific account", async () => {
        const spacehorseInstance = await Spacehorse.deployed();
        const txResutl = await spacehorseInstance.safeMint(accounts[0], "spacehorse_1.json");
        // assert.equal(txResutl.logs[0].event, "Transfer", "Event is not the transfer Event");
        // assert.equal(txResutl.logs[0].args.from, "0x0000000000000000000000000000000000000000", "From is not the zero address");
        truffleAssert.eventEmitted(txResutl, "Transfer", { from: '0x0000000000000000000000000000000000000000', to: accounts[0], tokenId: web3.utils.toBN("0") });
        assert.equal(await spacehorseInstance.ownerOf(0), accounts[0], "Owner of Token 1 not equal account 1");
    })

});