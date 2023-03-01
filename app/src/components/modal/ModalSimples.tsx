import React, { useState, Fragment, ReactNode, useImperativeHandle, useRef } from 'react';
import { Dialog, Transition } from '@headlessui/react';

interface IModalSimplesProps {
    button: {
        children: ReactNode;
        props?: React.DetailedHTMLProps<React.ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>;
    } | null;

    // todos os custom deve ser padrão tailwind
    panelCustomClass?: {
        bgColor?: string;
        size?: string;
    };
    titleClassname?: string;
    onOpen?: (v: boolean) => void;
    children?: ReactNode;
    textTitle?: JSX.Element | string;
    textSubtitle?: JSX.Element | string;
    isOpen?: boolean;
    setIsOpen?: (v: boolean) => void;

    isRenderModal?: boolean;
}

export interface IModalSimplesRef {
    openModal: () => void;
    closeModal: () => void;
}

const ModalSimples = React.forwardRef<IModalSimplesRef, IModalSimplesProps>(
    (
        {
            button,
            children,
            panelCustomClass,
            titleClassname,
            onOpen,
            textTitle,
            textSubtitle,
            isOpen: stateOpen,
            setIsOpen: setStateOpen,
            isRenderModal,
        },
        ref,
    ) => {
        const [isOpen, setIsOpen] = useState(stateOpen || false);

        // exportar funcao para componente pai
        useImperativeHandle(ref, () => ({
            closeModal() {
                onOpen && onOpen(false);
                setStateOpen ? setStateOpen(false) : setIsOpen(false);
            },
            openModal() {
                onOpen && onOpen(true);
                setStateOpen ? setStateOpen(true) : setIsOpen(true);
            },
        }));

        function closeModal() {
            onOpen && onOpen(false);
            setStateOpen ? setStateOpen(false) : setIsOpen(false);
        }

        function openModal() {
            onOpen && onOpen(true);
            setStateOpen ? setStateOpen(true) : setIsOpen(true);
        }

        const ButtonModal = () => {
            const buttonOnCLick = (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
                button && button.props && button.props.onClick && button.props.onClick(e);
                openModal();
            };

            return button === null ? null : (
                <button
                    type="button"
                    {...button?.props}
                    onClick={(e) => {
                        buttonOnCLick(e);
                    }}
                >
                    {button?.children}
                </button>
            );
        };

        const cancelButtonRef = useRef<HTMLButtonElement>(null); // verificar uma forma de não aparecer o erro <FocusTrap />

        return (
            <>
                {/* Bottoma para abrir modal */}
                <ButtonModal />

                {/*
                    - verifica se o modal já pode ser montado/renderizado, caso seja necessário esperar alguma consuita na API 
                    - verifica se ele já está aberto
                */}
                {isRenderModal === false ? null : isOpen || stateOpen ? (
                    <Transition appear show={stateOpen && setStateOpen ? stateOpen : isOpen} as={Fragment}>
                        <Dialog
                            as="div"
                            className="relative z-10"
                            initialFocus={cancelButtonRef}
                            onClose={() => {
                                if (event instanceof PointerEvent === false) {
                                    closeModal();
                                }
                            }}
                        >
                            <div className="fixed inset-0 bg-black bg-opacity-25" />

                            <div className="fixed inset-0 overflow-y-auto ">
                                <div className="flex min-h-full items-center justify-center text-center">
                                    <Dialog.Panel
                                        className={`
                                            inline-block text-normal text-left align-middle transition-all transform shadow-lg rounded-sm my-[10px] text-padrao
                                            ${panelCustomClass?.bgColor || 'bg-gray-100'} 
                                            ${panelCustomClass?.size || 'w-[80%] md:w-1/2'} 
                                        `}
                                    >
                                        <Dialog.Title
                                            className={`
                                                ${
                                                    titleClassname
                                                        ? titleClassname
                                                        : 'p-5 bg-white h-[50px] flex items-center justify-between'
                                                }
                                            `}
                                        >
                                            <div className="text-normal font-normal text-padrao flex flex-col md:flex-row md:items-center">
                                                <span>{textTitle}</span>{' '}
                                                <span className="md:ml-10px text-10px text-medium/60">
                                                    {textSubtitle}
                                                </span>
                                            </div>
                                            <button
                                                className="float-right text-gray-400 hover:text-gray-300"
                                                onClick={closeModal}
                                                ref={cancelButtonRef}
                                            >
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    className="h-20px w-20px"
                                                    fill="none"
                                                    viewBox="0 0 24 24"
                                                    stroke="currentColor"
                                                >
                                                    <path
                                                        strokeLinecap="round"
                                                        strokeLinejoin="round"
                                                        strokeWidth={2}
                                                        d="M6 18L18 6M6 6l12 12"
                                                    />
                                                </svg>
                                            </button>
                                        </Dialog.Title>
                                        {children}
                                    </Dialog.Panel>
                                </div>
                            </div>
                        </Dialog>
                    </Transition>
                ) : null}
            </>
        );
    },
);

ModalSimples.displayName = 'ModalSimples';

export { ModalSimples };
