
juno = import_module("./clients/juno.star")
papyrus = import_module("./clients/papyrus.star")


def run(plan, participants, eth_url):
    for participant in participants:
        module = import_module("./clients/{}.star".format(participant["type"]))
        module.run(plan, participant, eth_url)
