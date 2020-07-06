PGDMP     2                    x            ordermgt    12.3    12.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16443    ordermgt    DATABASE     z   CREATE DATABASE ordermgt WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE ordermgt;
                postgres    false            �            1259    16444 	   orderbook    TABLE     �   CREATE TABLE public.orderbook (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP(2) NOT NULL,
    status text
);
    DROP TABLE public.orderbook;
       public         heap    postgres    false            �            1259    16447    order book_id_seq    SEQUENCE     �   CREATE SEQUENCE public."order book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."order book_id_seq";
       public          postgres    false    202            �           0    0    order book_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public."order book_id_seq" OWNED BY public.orderbook.id;
          public          postgres    false    203            �            1259    16459    order_details    TABLE     p   CREATE TABLE public.order_details (
    order_id integer NOT NULL,
    details json,
    id integer NOT NULL
);
 !   DROP TABLE public.order_details;
       public         heap    postgres    false            �            1259    16491    order_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_details_id_seq;
       public          postgres    false    204            �           0    0    order_details_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;
          public          postgres    false    205            �           2604    16493    order_details id    DEFAULT     t   ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);
 ?   ALTER TABLE public.order_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            �           2604    16449    orderbook id    DEFAULT     o   ALTER TABLE ONLY public.orderbook ALTER COLUMN id SET DEFAULT nextval('public."order book_id_seq"'::regclass);
 ;   ALTER TABLE public.orderbook ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            �          0    16459    order_details 
   TABLE DATA           >   COPY public.order_details (order_id, details, id) FROM stdin;
    public          postgres    false    204   _       �          0    16444 	   orderbook 
   TABLE DATA           F   COPY public.orderbook (id, customer_id, datetime, status) FROM stdin;
    public          postgres    false    202   T       �           0    0    order book_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."order book_id_seq"', 1, true);
          public          postgres    false    203            �           0    0    order_details_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.order_details_id_seq', 29, true);
          public          postgres    false    205            �           2606    16454    orderbook order book_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.orderbook
    ADD CONSTRAINT "order book_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.orderbook DROP CONSTRAINT "order book_pkey";
       public            postgres    false    202                       2606    16502     order_details order_details_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public            postgres    false    204                        1259    16473    fki_order_id_to_order_book_id    INDEX     [   CREATE INDEX fki_order_id_to_order_book_id ON public.order_details USING btree (order_id);
 1   DROP INDEX public.fki_order_id_to_order_book_id;
       public            postgres    false    204                       2606    16468 '   order_details order_id_to_order_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_id_to_order_book_id FOREIGN KEY (order_id) REFERENCES public.orderbook(id) NOT VALID;
 Q   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_id_to_order_book_id;
       public          postgres    false    204    202    3071            �   �   x�œ1n�0Eg�S�����d���	�I�,Mj8C���lY
i��%�|�����0"Z$��l1A�2A�2Ci���݉����wo;'�g�T�cy����lww�/��a��,�}�χ�:Pn?�������Q��V�JExh�D�Щ����1�҃(�:˗��lO�n�=��l;��mW�Y�'�`���`���"F����vWD�M�F���E̕���eZ���	�<      �   4  x�e�;n�0��>�/�?�$�,)i�:�)������h㍑����@s������������F+��Ԝ�]D*Qo��Uҝz�d�tP�H�d�Ā�"��$O�����X%�d |�j�#��4TM̌��95`>���&=�]���<	o��Ŵ��5�^���#��Q�87��f>L�+�R,{CV�� �,��n�*��5�����3f�|��1�	��%�Hw�u����1�Ʋ�m�5g�ѕ���Y�jb�xz�<�a�O���ó��m�}��"���G�nH�w�m�G�a�KT�k�����[�V     