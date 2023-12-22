def run(plan, name, default_image, default_cmd, rpc_port, eth_url, participant):
    plan.add_service(
        name=name,
        config=ServiceConfig(
            image=participant.get("image", default_image),
            cmd=default_cmd + participant.get("extra_args", []),
            ports={
                "rpc": PortSpec(
                    number=rpc_port,
                    transport_protocol="TCP",
                    application_protocol="http",
                )
            }
        ),
    )
