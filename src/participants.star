juno = import_module("./clients/juno.star")
papyrus = import_module("./clients/papyrus.star")


def run_participant(plan, name, participant, eth_url):
    module = import_module("./clients/{}.star".format(participant["type"]))
    return module.run(plan, name, participant, eth_url)


def run(plan, participants, eth_url):
    return [run_participant(plan, "{}-{}".format(participant["type"], index), participant, eth_url) for (index, participant) in enumerate(participants)]
