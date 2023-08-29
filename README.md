# Verifiable Logistic Regression in Cairo

This is a submission for the ETHToronto hackathon (2023).

Please see the `notebooks` directory for the Python code of synthetic dataset generation as well as generation of dataset in Cairo.
The process of solving the logistic regression problem is present as well.

The `src` directory contains the Cairo code. We make use of the Orion framework for tensor manipulation.
The `train.cairo` file contains the functions to run gradient descent in Cairo. This can be used as a scaffold for verifiable deep learning.

We use `Scarb` for managing the installation of Cairo.

To run the tests:
```
scarb test
```

The output of the test should correspond to the same result in the Jupyter notebooks. 
I set the number of iterations to be `100` to keep the script consise. Running it for more iterations would lead to a further decrease in loss and better results.
Learning rate `alpha` and number of iterations are parameters that can be specified by the user.


Deployment steps 🚀

``` 
scarb build
```

```
starkli declare target/dev/logistic_regression.sierra \
    --compiler-version 2.2.0 \
    --rpc http://0.0.0.0:5050 \
    --account ~/.starkli-wallets/deployer/account0_account.json \
    --keystore ~/.starkli-wallets/deployer/account0_keystore.json
```

Deploy on Katana
```
starkli deploy 0x056486e36366049e8475e58e309668d0d829f8e7a1303737f1e6804844adfd09 42 
--rpc http://0.0.0.0:5050 \
--account ~/.starkli-wallets/deployer/account0_account.json \
--keystore ~/.starkli-wallets/deployer/account0_keystore.json 
```

Call smart contract ☎️
```
starkli call 0x07ba115d69cb54cd1ab4559cfd2386ff7fa44303896507f6c610d005dd52a10e get \
    --rpc http://0.0.0.0:5050
```

Invoke function smart contract ☎️
```
starkli invoke 0x07ba115d69cb54cd1ab4559cfd2386ff7fa44303896507f6c610d005dd52a10e set 5 \
    --rpc http://0.0.0.0:5050 --account ~/.starkli-wallets/deployer/account0_account.json \
    --keystore ~/.starkli-wallets/deployer/account0_keystore.json
```

TODO:
[ ] wrap ml code in https://book.cairo-lang.org/ch99-00-starknet-smart-contracts.html  #[contract]