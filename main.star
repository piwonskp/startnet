ethereum = import_module(
    "github.com/kurtosis-tech/ethereum-package/main.star"
)
participants = import_module("./src/participants.star")


DEFAULT = {
    "participants": []
}


def run(plan, args=DEFAULT):
    output = ethereum.run(plan, {"additional_services": ["dora"]})
    eth_url = "ws://{}:{}".format(output.all_participants[0].el_client_context.ip_addr, output.all_participants[0].el_client_context.ws_port_num)

    participants.run(plan, args["participants"], eth_url)
