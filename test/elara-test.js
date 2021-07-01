const { expect } = require("chai");
const BigNumber = require('bignumber.js');

describe("Elara", function() {
  it("Should return the total balances of contract owner", async function() {
    const [owner, addr] = await ethers.getSigners();
    const Elara = await ethers.getContractFactory("Elara");
    const elara = await Elara.deploy();
    await elara.deployed();
    const balance= await elara.balanceOf(owner.address);

  });
});
