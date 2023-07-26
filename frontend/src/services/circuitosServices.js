import httpClient from "./httpClient";

const END_POINT = "/circuitos/"
const END_POINT2 = "/clientes/"
const END_POINT3 = "/envio/"

const getAllCircuitos = () => httpClient.get(END_POINT);
const getAllClientes = () => httpClient.get(END_POINT2);
const getAllEnvios = () => httpClient.get(END_POINT3);

export{
    getAllCircuitos,
    getAllClientes,
    getAllEnvios
}
