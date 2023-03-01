import { InputDinheiro } from '@/components/form/InputMask';
import { IModalSimplesRef, ModalSimples } from '@/components/modal/ModalSimples';
import { regexDinheiro } from '@/components/text/regex';
import { ICooperativa } from '@/interfaces/ICooperativa';
import { cooperativas } from '@/utils/data/cooperativas';
import { useEffect, useRef, useState } from 'react';

export default function Home() {
    const [valor, setValor] = useState<string>('');
    const [valorRange, setValorRange] = useState<number>();
    const [cooperativaSelecionada, setCooperativaSelecionada] = useState<ICooperativa | null>(null);

    const valorNumber = Number(valor.replace('R$', '').replace('.', '').replace(',', '.'));

    useEffect(() => {
        if (valorRange) {
            setValor(regexDinheiro(valorRange.toString()));
        }
    }, [valorRange]);

    useEffect(() => {
        setCooperativaSelecionada(null);
    }, [valorRange, valor]);

    const pCooperativasRef = useRef<HTMLParagraphElement>(null);
    const pResultEconomiaAnual = useRef<HTMLParagraphElement>(null);

    const executeScrollCooperativas = () => pCooperativasRef.current && pCooperativasRef.current.scrollIntoView();
    const executeScrollResultEconomiaAnual = () =>
        pResultEconomiaAnual.current && pResultEconomiaAnual.current.scrollIntoView();

    const mediaEconomia = () => {
        if (!cooperativaSelecionada) return null;

        const v = Number(valor.replace('R$', '').replace('.', '').replace(',', '.'));

        return {
            anual: v * cooperativaSelecionada.desconto * 12,
            mensal: v * cooperativaSelecionada.desconto,
        };
    };

    const modalRef = useRef<IModalSimplesRef>(null);

    console.log(valorNumber);

    return (
        <main className="text-padrao text-normal">
            <nav className="w-full bg-white h-[60px] flex items-center justify-center border-b-4 border-verde-1">
                <div className="font-bold text-12px">
                    <p>
                        Economize agora em <span className="text-verde-3">ENERGIA</span>
                    </p>
                </div>
            </nav>
            <section className="bg-cinza-3 p-40px ">
                <div className="text-center ">
                    <p className="font-semibold text-[26px]">
                        Faça o cálculo da <span className="text-verde-3">economia na sua conta</span> de energia
                        residencial ou empresarial.
                    </p>
                    <p className="mt-20px">
                        As Cooperativas de Energia são empresas que adquirem energia excedente de usinas e de outras
                        casas/empresas com sistemas de geração, e vendem para os consumidores a preços mais acessíveis
                        do que os das distribuidoras convencionais.
                    </p>
                    <p className="mt-20px">
                        Descubra a opção mais vantajosa dentre as Cooperativas de Energia disponíveis no Brasil e faça
                        sua contratação agora mesmo!
                    </p>
                </div>
                <div className="mt-[60px] flex justify-center">
                    <div className="flex flex-col ">
                        <label htmlFor="valor" className="text-center text-12px block mb-10px">
                            Informe o valor médio mensal de sua conta de energia
                        </label>
                        <InputDinheiro
                            onChange={setValor}
                            value={valor}
                            props={{
                                className:
                                    'border-cinza-1 rounded-[20px] h-40px focus:border-verde-1 focus:ring-0 px-20px w-full text-center',
                                placeholder: 'R$ 1.000,00',
                            }}
                        />
                        <input
                            type="range"
                            className="w-full h-[6px] bg-cinza-2 rounded-lg appearance-none cursor-pointer range-lg mt-20px"
                            onChange={(e) => setValorRange(e.target.valueAsNumber)}
                            min={100}
                            max={15000000}
                            step={100}
                            defaultValue={100}
                        />
                        <div className="flex justify-between text-10px mt-10px text-cinza-1">
                            <p>R$ 1,00</p>
                            <p>R$ 150.000,00</p>
                        </div>
                        <button
                            disabled={!valor && true}
                            className="mt-10px text-white bg-verde-1 rounded-[20px] h-40px hover:bg-verde-1/90 disabled:bg-cinza-1"
                            onClick={executeScrollCooperativas}
                        >
                            Consultar ofertas
                        </button>
                    </div>
                </div>
            </section>
            <section className="p-40px ">
                <p className="text-center mb-20px" ref={pCooperativasRef}>
                    {valor
                        ? 'Selecione a Cooperativa com a oferta desejada:'
                        : 'Informe o valor acima para que possa verificar as ofertas'}
                </p>

                <div className="flex flex-wrap gap-20px justify-center">
                    {valor &&
                        cooperativas
                            .filter(
                                (cooperativa) =>
                                    cooperativa.valorMaximoMensal >= valorNumber &&
                                    cooperativa.valorMinimoMensal <= valorNumber,
                            )
                            .map((cooperativa, index) => (
                                <button
                                    key={index}
                                    className={`
                                    w-full sm:w-1/2 lg:w-1/3 bg-verde-3/10 p-20px min-w-[200px] max-w-min border rounded-[6px] hover:border-verde-3
                                    ${
                                        cooperativaSelecionada?.id === cooperativa.id
                                            ? 'bg-verde-3/20 border-verde-3'
                                            : ''
                                    }
                                `}
                                    onClick={() => {
                                        setCooperativaSelecionada(cooperativa);
                                        setTimeout(() => {
                                            executeScrollResultEconomiaAnual();
                                        }, 500);
                                    }}
                                >
                                    <p className="font-bold">{cooperativa.nome}</p>
                                    <div className="mt-10px divide-y">
                                        <div className="flex justify-between  p-10px">
                                            <span className="text-14px text-medium">Economia</span>
                                            <span className="font-semibold">{cooperativa.desconto * 100}%</span>
                                        </div>
                                        <div className="flex justify-between   p-10px">
                                            <span className="text-14px text-medium">Contrato</span>
                                            <span className="font-semibold">
                                                {cooperativa.contratoPF && cooperativa.contratoPJ && 'PJ e PF'}
                                                {cooperativa.contratoPF && !cooperativa.contratoPJ && 'PF'}
                                                {!cooperativa.contratoPF && cooperativa.contratoPJ && 'PJ'}
                                            </span>
                                        </div>
                                    </div>
                                    {cooperativaSelecionada?.id === cooperativa.id && (
                                        <p className="mt-10px font-semibold text-14px">Selecionada</p>
                                    )}
                                </button>
                            ))}
                </div>
            </section>
            {cooperativaSelecionada && (
                <section className="bg-cinza-3 p-40px text-center">
                    <p className="font-semibold" ref={pResultEconomiaAnual}>
                        Sua economia anual será de até
                    </p>
                    <p className="text-[30px] font-bold text-verde-3">
                        {regexDinheiro(mediaEconomia()?.anual.toFixed(2) || '')}
                    </p>
                    <p className="mt-10px font-semibold">
                        Em média {regexDinheiro(mediaEconomia()?.mensal.toFixed(2) || '')} por mês*
                    </p>
                    <p className="text-10px mt-20px">
                        *Essa é apenas uma simulação e não configura garantia do desconto.
                    </p>
                    <ModalSimples
                        ref={modalRef}
                        button={{
                            children: ' Contratar agora!!!',
                            props: {
                                className:
                                    'bg-verde-3 px-40px rounded-[20px] text-white font-bold mt-20px text-20px h-[80px] sm:h-40px',
                            },
                        }}
                        titleClassname="hidden"
                    >
                        <div className="p-40px text-center">
                            Parabéns, você acaba de contratar a cooperativa{' '}
                            <span className="text-20px font-bold">{cooperativaSelecionada.nome}</span>
                            <div className="mt-40px">
                                <button
                                    className="px-30px py-10px bg-verde-1 hover:bg-verde-1/90 text-white rounded-[20px] text-12px"
                                    onClick={() => modalRef.current?.closeModal()}
                                >
                                    Fechar
                                </button>
                                <p className="text-10px text-medium mt-10px">Para fechar pressione ESC</p>
                            </div>
                        </div>
                    </ModalSimples>
                </section>
            )}
        </main>
    );
}
