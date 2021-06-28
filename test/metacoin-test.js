const { expect } = require("chai");

describe("MetaCoin", function() {
  it("Should return the total balances of contract owner", async function() {
    const [owner, addr] = await ethers.getSigners();
    const MetaCoin = await ethers.getContractFactory("MetaCoin");
    const metaCoin = await MetaCoin.deploy();
    await metaCoin.deployed();
    expect(await metaCoin.getBalance(owner.address)).to.equal(1000);

    await metaCoin.transfer(addr.address, 100);
    expect(await metaCoin.getBalance(addr.address)).to.equal(100);
    expect(await metaCoin.getBalance(owner.address)).to.equal(900);

  });
});
