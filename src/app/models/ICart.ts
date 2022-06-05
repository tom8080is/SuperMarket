export class ICart {
    public constructor(
        public productId?: number,
        public productName?: string,
        public amount?: number,
        public price?: number,
        public image?: string,
    ) { }
}

