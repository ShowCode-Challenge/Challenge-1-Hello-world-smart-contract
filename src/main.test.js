beforeAll(async function () {
    // NOTE: nearlib and nearConfig are made available by near-cli/test_environment
    const near = await nearlib.connect(nearConfig);
    window.accountId = nearConfig.contractName;
    window.contract = await near.loadContract(nearConfig.contractName, {
        viewMethods: ["getGreeting"],
        changeMethods: [],
        sender: window.accountId,
    });
});

test("getGreeting", async () => {
    const name = await window.contract.get_name({
        accountId: window.accountId,
    });
    console.log("name: ", name);
});
